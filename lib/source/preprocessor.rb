# Create a pre-processor for doing the following changes:
# - On the third element of the CSV (jp_postcodes.csv), split the string by a space and add a column for ward
# - Generate a new JSON file with the key as the postal code and the value as an object with the following keys:
#  - prefecture
#  - city
#  - ward
#  - district

require 'csv'
require 'json'

# Read the CSV file and process the data
csv_data = []
File.open('./jp_postcodes.csv', 'r') do |file|
  csv_data = CSV.parse(file.read, headers: true, encoding: "Shift_JIS")
end

puts "csv_data: #{csv_data.first(10)}"

processed_data = {}

csv_data.each do |row|
  postcode = row['postcode']
  prefecture = row['prefecture']
  address = row['address']
  district = row['district']

  # Split the address by space to extract city and ward
  address_parts = address.split('　'.encode("Shift_JIS","UTF-8"))

  city = address_parts[1].nil? ? "" : address_parts[0]
  ward = address_parts[1].nil? ? address_parts[0] : address_parts[1]

  # If the city contains "区", make it a town
  if city.include?("区".encode("Shift_JIS","UTF-8"))
    town = city
    city = ""
  else
    town = ""
  end

  # If the ward contains "市", make it a city
  if ward.include?("市".encode("Shift_JIS","UTF-8"))
    city = ward
    ward = ""
  end


  processed_data[postcode] = {
    'prefecture' => prefecture,
    'city' => city,
    'ward' => ward,
    'district' => district
  }
end

# Write processed data to a new JSON file
File.open('processed_data.json', 'w') do |file|
  file.write(JSON.pretty_generate(processed_data))
end

puts 'Processing complete!'
