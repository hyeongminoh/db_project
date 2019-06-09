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
                        for (var i = 0; i < top_res.length; i++) {
                            console.log(i, ":", top_res[i].idrestaurant)
                            connection.query('SELECT * FROM restaurant where idrestaurant = ?', top_res[i].idrestaurant, (err, results) => {
                                selected_res.push(results[0])
                                count++
                                if (count == top_res.length) {
                                    console.log(selected_res)
                                    console.log(locations);
                                    res.render('index', {
                                        'types': types,
                                        'locations': locations,
                                        'restaurants': restaurant,
                                        'selected': selected_res
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
                    var posts = []
                    for (var j = 0; j < results.length; j++) {
                        var temp = {
                            idgroup_post: '',
                            title: '',
                            content: '',
                            post_time: '',
                            nickname: '',
                            reply_cnt: 0
                        }
                        temp.idgroup_post = results[j].idgroup_post
                        temp.title = results[j].title
                        temp.content = results[j].content
                        temp.post_time = results[j].post_time
                        temp.nickname = results[j].nickname
                        posts.push(temp)

                    }
                    connection.query('SELECT count(*) "replyCnt",idgroup_post  FROM group_reply Group by idgroup_post', (err, results) => {
                        if (err) {
                            console.log(err);
                            res.render('error');
                        }
                        console.log(results)
                        for (var j = 0; j < results.length; j++) {
                            for (var i = 0; i < posts.length; i++) {
                                if (posts[i].idgroup_post == results[j].idgroup_post) {
                                    console.log(results[j].idgroup_post)
                                    posts[i].reply_cnt = results[j].replyCnt
                                    break;
                                }
                            }
                        }
                        console.log(posts);
                        res.render('dashboard', {
                            'types': types,
                            'posts': posts
                        });

                    });
                });
            });
        });
    });

    app.get('/single-board/:idgroup_post', function (req, res, next) {
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
                    restaurant = results;
                    connection.query('SELECT * FROM group_post WHERE idgroup_post LIKE ?', [req.params.idgroup_post], (err, results) => {
                        posts = results;
                        console.log(posts);
                        connection.query('SELECT * FROM user WHERE user_num LIKE ?', [posts[0].user_num], (err, results) => {
                            post_user = results;
                            connection.query('SELECT * FROM user u, group_reply gr WHERE u.user_num = gr.user_num AND gr.idgroup_post LIKE ?', [req.params.idgroup_post], (err, results) => {
                                reply_user = results;
                                if (err) {
                                    console.log(err);
                                    res.render('error');
                                }

                                res.render('single-board', {
                                    'types': types,
                                    'locations': locations,
                                    'restaurants': restaurant,
                                    'posts': posts,
                                    'post_user': post_user,
                                    'reply_user': reply_user,

                                });
                            });
                        });
                    });

                });
            });
        });
    });

    app.post('/single-board/:idgroup_post', function (req, res, next) {
        var body = req.body;
        connection.query('SELECT COUNT(*) as gr FROM group_reply ', (err, results) => {
            if (err) {
                console.log(err);
                res.render('error');
            }
            reply_count = results;

            var tzoffset = (new Date()).getTimezoneOffset() * 60000;
            connection.query('INSERT INTO group_reply(idgroup_reply, idgroup_post, user_num, content, reply_time) values (?,?,?,?,?)', [reply_count[0].gr + 1, req.params.idgroup_post, 0, body.content, new Date(Date.now() - tzoffset).toISOString().slice(0, 19).replace('T', ' ')], (err, results) => {
                if (err) {
                    console.log(err);
                    res.render('error');
                }
                console.log(results);
                res.redirect('/single-board/'+req.params.idgroup_post);
            });

        });
    });

    app.post('/create-single-dashboard', function (req, res, next) {
        var body = req.body;
        connection.query('SELECT COUNT(*) as gp FROM group_post', (err, results) => {
            if (err) {
                console.log(err);
                res.render('error');
            }
            post_count = results;

            var tzoffset = (new Date()).getTimezoneOffset() * 60000;
            connection.query('INSERT INTO group_post(idgroup_post, user_num, title, content, post_time) values (?,?,?,?,?)', [post_count[0].gp + 1, 0, body.name, body.content, new Date(Date.now() - tzoffset).toISOString().slice(0, 19).replace('T', ' ')], (err, results) => {
                if (err) {
                    console.log(err);
                    res.render('error');
                }
                console.log(results);
                res.redirect('/dashboard');
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


