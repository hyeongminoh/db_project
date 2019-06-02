module.exports = function(app){

	const http = require('http');
	const express = require('express');
	const router = express.Router();
	const url = require('url');



	/* GET home page. */
	app.get('/', function(req, res, next) {
  		res.render('index');
	});
	app.get('/restaurant', function(req, res, next) {
		res.render('restaurant');
  	});


}