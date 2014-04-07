fs = require("fs")
md = require("marked")

exports.page = (req, res)->
  page_name = req.params["name"]
  markdown_content = fs.readFileSync("md_page/"+page_name+".md", {encoding:"utf-8"})
  res.render("md_page",{"md":md,"markdownContent":markdown_content})