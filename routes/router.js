module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	/* GET home page. */
	app.get('/', function(req, res, next) {
       
        connection.query('SELECT * FROM menu_type',  (err, results) => {
        	if (err){
          		console.log(err);
          		res.render('error');
     	 	}
     		types = results;
     		console.log(types);
      		connection.query('SELECT * FROM location',  (err, results) => {
        		if (err){
          			console.log(err);
          			res.render('error');
      			}
      			locations = results;
      			connection.query('SELECT * FROM restaurant r, location l WHERE r.idlocation=l.idlocation',  (err, results) => {


      				console.log(results);
      				console.log(locations);
      				res.render('index', {
            		'types' : types,
            		'locations': locations,
            		'restaurants': results

            		});


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


	app.get('/category/:categoryid', function(req, res, next) {

  		var body = req.body;
   		var searchword = body.searchword;
   		console.log(searchword);
   		var locatons;
       	var types;
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
      			connection.query('SELECT * FROM restaurant WHERE idmenu_type LIKE ?', [req.params.categoryid],  (err, results) => {
        		if (err){
          			console.log(err);
          			res.render('error');
      			}

      			console.log(results);
      			
      			res.render('category', {
            		'types' : types,
            		'locations': locations,
            		'restaurants': results,
      			});

    			});
  			});
    	});
    });


  	app.get('/user', function(req, res, next) {
		res.render('user-profile');
  	});


  	app.post('/do_search', function(req, res, next) {

  		var body = req.body;
   		var searchword = body.searchword;
   		console.log(searchword);
   		var locatons;
       	var types;
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
      			connection.query('SELECT * FROM restaurant WHERE r_name LIKE ?', ['%' + searchword +'%'],  (err, results) => {
        		if (err){
          			console.log(err);
          			res.render('error');
      			}

      			console.log(types);
      			console.log(locations);
      			console.log(results);
      			
      			res.render('search', {
            		'types' : types,
            		'locations': locations,
            		'search_results': results,
            		'searchword': searchword
      			});

    			});
  			});
    	});
    });


  	


}