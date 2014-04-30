fs = require("fs")

regitem_path = "data/regex_detail"
regitem_index_path = "data/regitems.json"
db_path = "data/db.json"

all_ids = ()->
  flist = fs.readdirSync(regitem_path)
  ids = (f[0..-6] for f in flist)

exports.all_ids_data = ()->
  JSON.parse(fs.readFileSync(regitem_index_path))

exports.db = JSON.parse(fs.readFileSync(db_path))

exports.update_db = ()->
  fs.writeFileSync(db_path,exports.db)

exports.all_ids = all_ids

exports.find_regitem_by_id = (id)->
  f = fs.readFileSync(regitem_path+"/"+id+".json",{"encoding":"utf-8"})

exports.indexing_regitems = ()->
  ids = all_ids()
  result = []
  for id in ids
    id_f = fs.readFileSync(regitem_path+"/"+id+".json")
    c = JSON.parse(id_f)
    result.push {
      "id": id,
      "name": c.name,
      "useage": c.describe
    }
  memory_regitems_cache = result
  fs.writeFileSync(regitem_index_path,JSON.stringify(result))
  console.log("write finished")

