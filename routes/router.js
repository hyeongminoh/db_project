module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	/* GET home page. */
	app.get('/', function(req, res, next) {
       
        connection.query('SELECT  type FROM menu_type',  (err, results) => {
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
      			console.log(locations);
      			res.render('index', {
            		'types' : types,
            		'locations': locations
            		
      			});
    		});
  		});
    });

	app.get('/dashboard', function(req, res, next){
		res.render('dashboard');
	});


	app.get('/error', function(req, res, next){
		res.render('error');
	});


	app.get('/category', function(req, res, next) {
       
        connection.query('SELECT  type FROM menu_type',  (err, results) => {
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
      			console.log(locations);
      			res.render('category', {
            		'types' : types,
            		'locations': locations
            		
      			});
    		});
  		});
    });



  	app.get('/user', function(req, res, next) {
		res.render('user-profile');
  	});


  	app.post('/do_search_restaurant', function(req, res, next) {
       
       	var body = req.body;
   		var searchword = body.searchword;
   		let resultitems = [];
        connection.query('SELECT  type FROM menu_type',  (err, results) => {
        	if (err){
          		console.log(err);
          		res.render('error');
     	 	}
     		types = results;

     		connection.query('SELECT * FROM restaurant WHERE r_name LIKE ? ', ['%' + searchword +'%'], (err, search_results) => {
     			if(error){
         			console.log('검색 실패');
      			}else{
         		//let search_result = results;
         			console.log('검색 완료. result: ', search_results);
      			}

      			connection.query('SELECT * FROM location',  (err, results) => {
        			if (err){
          				console.log(err);
          				res.render('error');
      				}
      				locations = results;
      				
      				res.render('search', {
            			'types' : types,
            			'locations': locations,
            			'items' : search_results
      				});
    			});

    		});
  		});
    });


}