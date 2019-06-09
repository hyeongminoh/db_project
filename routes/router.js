module.exports = function (app) {

    const http = require('http');
    const express = require('express');
    const router = express.Router();
    const url = require('url');


    /* GET home page. */
    app.get('/', function (req, res, next) {

        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
                console.log(err);
                res.render('error');
            }
            types = results;
            console.log(types);
            connection.query('SELECT * FROM location', (err, results) => {
                if (err) {
                    console.log(err);
                    res.render('error');
                }
                locations = results;
                connection.query('SELECT * FROM restaurant r, location l WHERE r.idlocation=l.idlocation', (err, results) => {
                    restaurant = results
                    connection.query('SELECT count(*) "reviewcnt"  ,idrestaurant FROM review group by idrestaurant limit 3', (err, results) => {
                        top_res = results
                        selected_res = []
                        count = 0
                        console.log(top_res.length)
                        for(var i =0; i<top_res.length; i++){
                            console.log(i,":",top_res[i].idrestaurant)
                            connection.query('SELECT * FROM restaurant where idrestaurant = ?',top_res[i].idrestaurant, (err, results) => {
                                selected_res.push(results[0])
                                count ++
                                if(count == top_res.length){
                                    console.log(selected_res)
                                    console.log(locations);
                                    res.render('index', {
                                        'types': types,
                                        'locations': locations,
                                        'restaurants': restaurant,
                                        'selected' : selected_res
                                    });
                                }
                            });
                        }
                        
                });
                });

            });
        });
    });

    app.get('/dashboard', function (req, res, next) {
        var locatons;
        var types;
        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
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

                connection.query('SELECT * FROM group_post gp, user u WHERE gp.user_num=u.user_num ORDER BY post_time ASC', (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }
                    posts = results;
                    console.log(posts);
                    connection.query('SELECT count(*) FROM group_post gp, group_reply gr WHERE gp.idgroup_post=gr.idgroup_post', (err, results) => {
                        if (err) {
                            console.log(err);
                            res.render('error');
                        }
                        console.log(results);
                        res.render('dashboard', {
                                'types': types,
                                'posts': posts,
                                'reply_num': results
                        });
                    
                    });
                });
            });
        });
    });

    app.get('/single-board', function (req, res, next) {
        var locatons;
        var types;
        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
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

                connection.query('SELECT * FROM group_post', (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }
                    posts = results;
                    console.log(posts);
                    connection.query('SELECT * FROM group_reply', (err, results) => {
                        if (err) {
                            console.log(err);
                            res.render('error');
                        }

                        connection.query('SELECT * FROM group_post gp, group_reply gr WHERE gp.idgroup_post=gr.idgroup_post', (err, results) => {
                            console.log(results);
                            res.render('single-board', {
                                'types': types,
                                'posts': results,
                                'restaurants': results
                            });
                        });
                    });
                });
            });
        });
    });

    app.get('/create-single-dashboard', function (req, res, next) {
        var locatons;
        var types;
        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
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

                console.log(results);

                res.render('create-single-dashboard', {
                    'types': types,
                    'locations': locations
                });

            });
        });
    });

    app.get('/error', function (req, res, next) {
        res.render('error');
    });


    app.get('/category/:categoryid', function (req, res, next) {

        var body = req.body;
        var searchword = body.searchword;
        console.log(searchword);
        var locatons;
        var types;
        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
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
                connection.query('SELECT * FROM restaurant WHERE idmenu_type LIKE ?', [req.params.categoryid], (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }

                    console.log(results);

                    res.render('category', {
                        'types': types,
                        'locations': locations,
                        'restaurants': results,
                    });

                });
            });
        });
    });


    app.get('/user', function (req, res, next) {
        res.render('user-profile');
    });


    app.post('/do_search', function (req, res, next) {

        var body = req.body;
        var searchword = body.searchword;
        console.log(searchword);
        var locatons;
        var types;
        connection.query('SELECT * FROM menu_type', (err, results) => {
            if (err) {
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
                connection.query('SELECT * FROM restaurant WHERE r_name LIKE ?', ['%' + searchword + '%'], (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }

                    console.log(types);
                    console.log(locations);
                    console.log(results);

                    res.render('search', {
                        'types': types,
                        'locations': locations,
                        'search_results': results,
                        'searchword': searchword
                    });

                });
            });
        });
    });


}