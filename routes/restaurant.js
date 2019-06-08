module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	app.get('/restaurant/:restaurantid', function(req, res, next) {
        var sqlquery =  "SELECT  * FROM restaurant WHERE idrestaurant=?";
        console.log("restaurantid:",req.params.restaurantid)
        var name,location,time,menu_type,reservation,phone,id_menu_type, idlocation,walk_time,image
        var menu = []
        var types;
        var locatons;
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
                        name = row[0].r_name
                        location = row[0].location
                        time = row[0].time
                        id_menu_type= row[0].idmenu_type
                        reservation = row[0].reservation
                        phone = row[0].phone
                        idlocation = row[0].idlocation
                        image = row[0].image
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
                                        res.render('restaurant',{types : types,info : info, menu : menu});
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
}
        

