module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	app.get('/restaurant/:restaurantid', function(req, res, next) {
        
		res.render('restaurant');
  	});


}