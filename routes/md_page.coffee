fs = require("fs")
md = require("marked")

exports.page = (req, res)->
  page_name = req.params["name"]
  markdown_content = fs.readFileSync("static_page/"+page_name+".md", {encoding:"utf-8"})
  res.render("static_page",{"md":md,"markdownContent":markdown_content})