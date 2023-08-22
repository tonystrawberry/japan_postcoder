# From the file jp_postcodes.json, add a new field for romaji values for each object and output a new JSON file
# {
#  "2140037": {
#    "prefecture": "神奈川県",
#    "prefecture_romaji": "Kanagawa-ken",
#    "city": "川崎市",
#    "city_romaji": "Kawasaki-shi",
#    "ward": "多摩区",
#    "ward_romaji": "Tama-ku",
#    "district": "西生田",
#    "district_romaji": "Nishi-Ikuta"
#  }
# }

require 'hanami'
require 'json'

data = JSON.parse(File.read(File.join(__dir__, "jp_postcodes.json")))

data.each do |key, value|
  data[key]["prefecture_romaji"] = Hanami.to_romaji(value["prefecture"])
  data[key]["city_romaji"] = Hanami.to_romaji(value["city"])
  data[key]["ward_romaji"] = Hanami.to_romaji(value["ward"])
  data[key]["district_romaji"] = Hanami.to_romaji(value["district"])
end

File.open('jp_postcodes_romaji.json', 'w') do |file|
  file.write(JSON.pretty_generate(data))
end
