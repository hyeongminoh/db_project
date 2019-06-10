module.exports = function(app){

    const http = require('http');
    const express = require('express');
    const router = express.Router();
	const url = require('url');
	const util = require('util');
    var bodyParser = require('body-parser');
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({extended :false}));

	app.get('/restaurant/:restaurantid', function(req, res, next) {
        var sqlquery =  "SELECT  * FROM restaurant WHERE idrestaurant=?";
        const sess = req.session;
        console.log("restaurantid:",req.params.restaurantid)
        var name,location,time,menu_type,reservation,phone,id_menu_type, idlocation,walk_time,image
                var idrestaurant
        var menu = []
        var types;
        var locatons;
                var content,review,star,like
                var review = []
                var idrestaurant
        connection.query('SELECT * FROM menu_type',  (err, results) => {
            if (err){
                console.log(err);
                res.render('error');
            }
            types = results;
            connection.query('SELECT * FROM location',  (err, results) => {
                if (err){
                    console.log(err);
                    res.render('error');
                }
                types = results;
                connection.query('SELECT * FROM location', (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }
                    locations = results;
                    connection.query(sqlquery, req.params.restaurantid, function (err, row) {
                        if (!err) {
                            idrestaurant = row[0].idrestaurant
                            name = row[0].r_name
                            location = row[0].location
                            time = row[0].time
                            id_menu_type = row[0].idmenu_type
                            reservation = row[0].reservation
                            phone = row[0].phone
                            idlocation = row[0].idlocation
                            image = row[0].image
                            console.log("row[0]", row[0].idrestaurant);

                            var sqlquery = "SELECT  * FROM menu_type WHERE idmenu_type=?";
                            connection.query(sqlquery, id_menu_type, function (err, row) {
                                if (!err) {
                                    menu_type = row[0].type
                                    var sqlquery2 = "SELECT  * FROM menu WHERE idrestaurant=?";
                                    connection.query(sqlquery2, req.params.restaurantid, function (err, row) {
                                        for (var i = 0; i < row.length; i++) {
                                            var temp = {
                                                menu_name: row[i].menu_name,
                                                price: row[i].price
                                            }
                                            menu.push(temp)
                                        }
                                    var sqlquery3 =  "SELECT  * FROM location WHERE idlocation=?";
                                    connection.query(sqlquery3, idlocation, function (err, row) {
                                        walk_time = row[0].time
                                        var info = {
                                            idrestaurant : idrestaurant ,
                                            name : name,
                                            location : location,
                                            time : time,
                                            menu_type: menu_type,
                                            reservation : reservation,
                                            phone : phone,
                                            walk_time : walk_time,
                                            image : image
                                        }
                                        console.log(info)
                                        console.log(menu)
										var sqlquery4 ="SELECT * FROM review WHERE idrestaurant=?";
										var review = []
										var count = 0
										connection.query(sqlquery4, req.params.restaurantid ,function(err, row)  {
										if (err){
												console.log(err)
												console.log('리뷰오류');
										}
										if(row.length == 0){
											review = []
											res.render('restaurant',{types : types,info : info, menu : menu, review: review,session : sess});
										}
										for(var i =0; i<row.length; i++){
											var temp = {
												review: '',
												star: '',
												idrestaurant:'',
												idreview : ''
												// hashtag: []
											}
											temp.idrestaurant = row[i].idrestaurant
											temp.review = row[i].review
											temp.idreview = row[i].idreview
											temp.star = row[i].star
											review.push(temp)
											var sqlquery5 ="SELECT h.content FROM hashtag h, hashtag_connection c WHERE h.idhashtag = c.idhashtag and c.idreview = ? and c.idrestaurant=?";
											console.log("reviewid", row[i].idreview)
											var reviewid = row[i].idreview
											connection.query(sqlquery5, [row[i].idreview,req.params.restaurantid] ,function(err, row1)  {
												console.log("hashtag:",row1)
												review[count].hashtag = row1
												count++
												if(count == row.length){
													console.log(review)
													res.render('restaurant',{types : types,info : info, menu : menu, review: review,session : sess});
												}
											});
										}
									});

                                })
                            })


                        } else {
                            console.log("식당 선택 오류!")
                        }

					});
				}
            });
        });
	});
    
    app.post('/restaurant/:restaurantid', async(req, res,next)  => {
	if(req.session.user_info == undefined){
		console.log("로그인 필요!");
		res.redirect('/restaurant/'+ req.params.restaurantid);
	}
	console.log(req.session.user_info.user_num)
	var user_num = req.session.user_info.user_num
    var body = req.body;
	var _hashtag = body.hashtag;
    var review = body.review;
	var star = body.star;
	var hashtag = []
	_hashtag = _hashtag.toString()
	_hashtag = _hashtag.split('#')
	for(var i = 1; i< _hashtag.length; i++){
		hashtag.push('#' + _hashtag[i])
	}
	console.log(hashtag)
	var sqlquery2 = "insert into review(user_num,idrestaurant,review,star) values (?,?,?,?)"
	const query = util.promisify(connection.query).bind(connection);
	var rows = await query(sqlquery2, [user_num,req.params.restaurantid,review,star]) 
		if (!rows.insertId) {
			await console.log(err);
			res.render('error');
		}
		else{
			var reviewid = rows.insertId
			await console.log("Review 테이블 insert 완료")
				var count = 0
				for(var j =0; j<hashtag.length; j++){
					var selectedhashtag = hashtag[j]
					var sqlquery4 = "insert into hashtag(content) values (?)"
					var row1 = query(sqlquery4, selectedhashtag)
						
					await console.log("hashtag 테이블 insert 완료")
					var sqlquery5 = "select * from hashtag where content = ?"
					var row2 = await query(sqlquery5, selectedhashtag)
					var idhashtag = row2[0].idhashtag
					var sqlquery6 ="insert into hashtag_connection(idreview,idhashtag,idrestaurant) values (?,?,?)"
					var row3 = query(sqlquery6, [reviewid,idhashtag,req.params.restaurantid])
					if (!row3) {
						console.log(err);
						res.render('error');
					}
					else{
						console.log("connection 테이블 insert 완료")
						count++
						if(count == hashtag.length){
							res.redirect('/restaurant/'+ req.params.restaurantid);
						}
					}
				}	
			}
		})

	})
})
}