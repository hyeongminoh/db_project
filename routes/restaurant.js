module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	app.get('/restaurant/:restaurantid', function(req, res, next) {
        var sqlquery =  "SELECT  * FROM restaurant WHERE idrestaurant=?";
        console.log("restaurantid:",req.params.restaurantid)
        var name,location,time,menu_type,reservation,phone,id_menu_type
        connection.query(sqlquery, req.params.restaurantid, function (err, row) {
            if(!err){
                // console.log(row)
                name = row[0].r_name
                location = row[0].location
                time = row[0].time
                id_menu_type= row[0].idmenu_type
                reservation = row[0].reservation
                phone = row[0].phone
                var sqlquery =  "SELECT  * FROM menu_type WHERE idmenu_type=?";
                connection.query(sqlquery, id_menu_type, function (err, row) {
                    if(!err){
                        menu_type = row[0].type
                        var sqlquery =  "SELECT  * FROM menu WHERE idrestaurant=?";
                        connection.query(sqlquery, req.params.restaurantid, function (err, row) {
                            var info = {
                                name : name,
                                location : location,
                                time : time,
                                menu_type: menu_type,
                                reservation : reservation,
                                phone : phone
                            }
                            var menu = []
                            for(var i =0; i<row.length; i++){
                                var temp = {
                                    menu_name : row[i].menu_name,
                                    price : row[i].price
                                }
                                menu.push(temp)
                            }
                            console.log(info)
                            console.log(menu)
                            res.render('restaurant',{info : info, menu : menu});
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
}
        

