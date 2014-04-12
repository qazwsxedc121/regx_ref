fs = require("fs")

all_ids = ()->
  flist = fs.readdirSync("data")
  ids = (f[0..-6] for f in flist)

exports.all_ids_names = ()->
  ids = all_ids()
  result = []
  for id in ids
    id_f = fs.readFileSync("data/"+id+".json")
    c = JSON.parse(id_f)
    name = c.name
    result.push {
      "id": id,
      "name": name
    }
  result

exports.all_ids = all_ids

exports.find_regitem_by_id = (id)->
  f = fs.readFileSync("data/"+id+".json")
