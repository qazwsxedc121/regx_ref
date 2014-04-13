fs = require("fs")

all_ids = ()->
  flist = fs.readdirSync("data")
  ids = (f[0..-6] for f in flist)

exports.all_ids_data = ()->
  ids = all_ids()
  result = []
  for id in ids
    id_f = fs.readFileSync("data/"+id+".json")
    c = JSON.parse(id_f)
    result.push {
      "id": id,
      "name": c.name,
      "useage": c.describe
    }
  result

exports.all_ids = all_ids

exports.find_regitem_by_id = (id)->
  f = fs.readFileSync("data/"+id+".json")
