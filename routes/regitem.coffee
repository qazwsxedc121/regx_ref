
model = require("../model")

exports.regitem = (req, res)->
  reg_id = req.params["id"]
  console.log(reg_id)
  flist = model.all_ids()
  f1 = (f for f in flist when f == reg_id)
  console.log(f1)
  if f1[0]
    context = model.find_regitem_by_id(f1[0])
    context = JSON.parse(context)
    res.render("regitem",context)
  else
    res.render("error",{"message":"没有找到相应编号的正则表达式!"})



exports.post_regitem = (req,res)->
  undefined


