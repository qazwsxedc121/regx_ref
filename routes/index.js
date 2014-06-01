
/*
 * GET home page.
 */

model = require("../model")

exports.index = function(req, res){
    var all_regex = model.all_ids_data();
    var db_index = model.db["index"];
    var regex_list = [];
    for(var i = 0; i < db_index.length; i += 1){
        for(var j = 0; j < all_regex.length; j += 1){
            if(db_index[i]["id"] == all_regex[j]["id"]){
                regex_list.push(all_regex[j]);
            }
        }
    }
    res.render('index', {
        title: '正则表达式参考',
        regex_list: regex_list
    });
};

exports.all = function(req, res){
    var all_regex = model.all_ids_data();
    res.render('regex_list', {
        title: '正则表达式参考',
        regex_list: all_regex,
        menu_selected: "/all"
    });
};