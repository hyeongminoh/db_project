module.exports = function (app) {

    const http = require('http');
    const express = require('express');
    const router = express.Router();
    const url = require('url');
    const sha256 = require('sha256');

    /* GET home page. */
    app.get('/', function (req, res, next) {

        const sess = req.session;

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
                                        'selected': selected_res,
                                        session : sess
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
        const sess = req.session;
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
                            'posts': posts,
                            session : sess
                        });

                    });
                });
            });
        });
    });

    app.get('/single-board/:idgroup_post', function (req, res, next) {
        const sess = req.session;
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
                                    session : sess
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
        const sess = req.session;
        connection.query('SELECT COUNT(*) as gr FROM group_reply ', (err, results) => {
            if (err) {
                console.log(err);
                res.render('error');
            }
            reply_count = results;

            var tzoffset = (new Date()).getTimezoneOffset() * 60000;
            connection.query('INSERT INTO group_reply(idgroup_reply, idgroup_post, user_num, content, reply_time) values (?,?,?,?,?)', [reply_count[0].gr + 1, req.params.idgroup_post, sess.user_info.user_num, body.content, new Date(Date.now() - tzoffset).toISOString().slice(0, 19).replace('T', ' ')], (err, results) => {
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
        const sess = req.session;   
        connection.query('SELECT COUNT(*) as gp FROM group_post', (err, results) => {
            if (err) {
                console.log(err);
                res.render('error');
            }
            post_count = results;

            var tzoffset = (new Date()).getTimezoneOffset() * 60000;
            connection.query('INSERT INTO group_post(idgroup_post, user_num, title, content, post_time) values (?,?,?,?,?)', [post_count[0].gp + 1, sess.user_info.user_num, body.name, body.content, new Date(Date.now() - tzoffset).toISOString().slice(0, 19).replace('T', ' ')], (err, results) => {
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
        const sess = req.session;
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
                    'locations': locations,
                    session : sess
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
        const sess = req.session;
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
                        session : sess
                    });

                });
            });
        });
    });


    app.get('/user', function (req, res, next) {
        res.render('user-profile');
    });

    
    app.get('/signin', function(req, res, next) {
    res.render('signin');
    });

    app.post('/do_search', function (req, res, next) {

        const sess = req.session;
        var body = req.body;
        var searchword = body.searchword;
        var hashtag = body.hashtag;
        console.log('식당',searchword);
        console.log('hashtag',hashtag);
        var locatons;
        var types;
        if(hashtag == ""){
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
                        'searchword': searchword,
                        session : sess
                    });

                });
            });
        });
       
        }else{
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
                sql = "SELECT DISTINCT r.r_name , r.idrestaurant, h.content, r.image FROM restaurant r, hashtag_connection c, hashtag h WHERE c.idhashtag= h.idhashtag AND c.idrestaurant = r.idrestaurant AND h.content = ?";
                connection.query(sql, [hashtag] , (err, results) => {
                    if (err) {
                        console.log(err);
                        res.render('error');
                    }

                    console.log(types);
                    console.log(locations);
                    console.log(results);

                    res.render('hashtag', {
                        'types': types,
                        'locations': locations,
                        'search_results': results,
                        'searchword': hashtag,
                        session : sess
                    });

                });
            });
        });
        }

    });

        //로그인 코드
      app.post('/do_signin',  function (req,res){
         const body = req.body;
         const nickname = req.body.nickname;
         var pass = req.body.pass;
         console.log(body);
         var flag = false;
         var id = 0;
         //유저 찾기
         connection.query('SELECT * FROM user WHERE nickname = ? LIMIT 1', [nickname], (err, result) => {
               if (err) throw err;
               console.log(result);

               if (result.length === 0) {
                     console.log('없음');
                     // res.json({success: false});
                     res.redirect(url.format({
                           pathname: '/signin',
                           query: {
                                 'success': false,
                                 'message': 'Login failed: ID does not exist'
                           }
                     }));
               } else {
                     if (pass != result[0].pw) {
                           console.log('비밀번호 불일치');
                           res.redirect(url.format({
                                 pathname: '/signin',
                                 query: {
                                       'success': false,
                                       'message': 'Login failed: Password Incorrect'
                                 }
                           }));
                     } else {
                           console.log('로그인 성공');

                           //세션에 유저 정보 저장
                           req.session.user_info = result[0];
                           flag = true;
                           id = result[0].user_id;
                           res.redirect('/');
                           // res.redirect(url.format({
                           //       pathname: '/',
                           //       query: {
                           //             'success': true,
                           //             'message': 'Login success'
                           //       }
                           // }));
                     }
               }
         });
   });

}


