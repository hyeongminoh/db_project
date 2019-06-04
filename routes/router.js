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

	app.get('/single-blog', function(req, res, next){
		res.render('single-blog');
	});

	app.get('/single', function(req, res, next) {
		res.render('single');
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

  	app.post('/do_search', function (req, res) {
  
   		var body = req.body;
   		var searchword = body.searchword;
   		let resultitems = [];
   		db.query('SELECT cat_id, cat_name FROM category', (err, results) => {
            if (err){
               console.log(err);
               res.render('error');
            }
   			categorys = results;
   
   		db.query('SELECT * FROM item WHERE item_name LIKE ? OR item_content LIKE ?', ['%' + searchword +'%','%' + searchword +'%'], function(error,results){
      		if(error){
         		console.log('검색 실패');
      		}else{
         		//let search_result = results;
         		console.log('검색 완료. result: ', results);
      		}

      		var temp = {"cat_name": searchword +  " 검색 결과"}
      		console.log(temp);
      		res.render('shop', {
            	'categorys' : categorys,
            	session : sess,
            	'items' : results,
            	'currentcategory': temp
      		});
   		});
		});
	});

}