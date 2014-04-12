
/*
 * GET home page.
 */

model = require("../model")

exports.index = function(req, res){
  all_regex = model.all_ids_names();
  res.render('index', {
      title: '正则表达式参考',
      regex_list: all_regex
  });
};