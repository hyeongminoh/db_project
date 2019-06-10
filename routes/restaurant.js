module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');
	var bodyParser = require('body-parser');
  	app.use(bodyParser.json());
	app.use(bodyParser.urlencoded({extended :false}));

	app.get('/restaurant/:restaurantid', function(req, res, next) {
        var sqlquery =  "SELECT  * FROM restaurant WHERE idrestaurant=?";
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
      			locations = results;
                connection.query(sqlquery, req.params.restaurantid, function (err, row) {
                    if(!err){
                        idrestaurant = row[0].idrestaurant
                        name = row[0].r_name
                        location = row[0].location
                        time = row[0].time
                        id_menu_type= row[0].idmenu_type
                        reservation = row[0].reservation
                        phone = row[0].phone
                        idlocation = row[0].idlocation
                        image = row[0].image
						console.log("row[0]", row[0].idrestaurant);

                        var sqlquery =  "SELECT  * FROM menu_type WHERE idmenu_type=?";
                        connection.query(sqlquery, id_menu_type, function (err, row) {
                            if(!err){
                                menu_type = row[0].type
                                var sqlquery2 =  "SELECT  * FROM menu WHERE idrestaurant=?";
                                connection.query(sqlquery2, req.params.restaurantid, function (err, row) {
                                        for(var i =0; i<row.length; i++){
                                            var temp = {
                                                menu_name : row[i].menu_name,
                                                price : row[i].price
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
												console.log('리뷰오류');
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
												// for(var k =0; k<review.length; k++){
												// 	if(review[k].idreview == reviewid){
												// 		for(var j =0; j<row1.length; j++){
												// 			review[k].hashtag.push(row1[j].content)
												// 		}
												// 	}
												// }
												count++
												if(count == row.length){
													console.log(review)
													res.render('restaurant',{types : types,info : info, menu : menu, review: review });
												}
											});
										}
									});

								})
							})
						}
						else{
							console.log("음식 선택 오류!")
						}
					})


				}
				else{
					console.log("식당 선택 오류!")
				}

                });
            });
        });
	});
	
	app.post('/restaurant/:restaurantid', function(req, res,next) {

	var body = req.body;
	var user_num = body.user_num;
	var content = body.content;
	var review = body.review;
	var star = body.star;
	console.log(user_num);
	console.log(content);
	console.log(review);
	console.log(star);
	console.log("restaurantid:", req.params.restaurantid);
	var insertQuery = 'INSERT INTO hashtag (content) VALUES (?)';
	connection.query(insertQuery, [content], function(err, results) {
		if (err) {
		console.log(err);
		res.render('error');
		}
		console.log("Data inserted!1");
		console.log(results);



		var insertQuery2 = 'INSERT INTO review (user_num,idrestaurant,review ,star)  VALUES (?,?,?,?)';
		connection.query(insertQuery2, [user_num, req.params.restaurantid, review, star], function(err, results) {
		if (err) {
			console.log(err);
			res.render('error');
		}
		console.log("Data inserted!2");
		console.log(results);


		var insertQuery3 = 'INSERT hashtag_connection (idreview,idhashtag,idrestaurant)SELECT t.idreview,h.idhashtag ,t.idrestaurant FROM review t, hashtag h WHERE t.review =? AND h.content= ?';
		connection.query(insertQuery3, [ review, content], function(err, results) {
			if (err) {
			console.log(err);
			res.render('error');
			}
			console.log("Data inserted!3");
			console.log(results);
					res.redirect('/restaurant/'+ req.params.restaurantid);

		});
		});
	});
	});
}
