# frozen_string_literal: true

require_relative 'version'
require_relative 'address'

require 'json'

## Main module for JapanPostcoder
# Contains methods to convert Japanese postal code to address
module JapanPostcoder
  class InvalidPostalCodeError < StandardError; end

  def self.to_address(postal_code, romaji: false)
    validate_postal_code!(postal_code)

    address = get_address(postal_code, romaji: romaji)

    address.to_s(romaji: romaji)
  end

  def self.to_address_hash(postal_code, romaji: false)
    validate_postal_code!(postal_code)

    address = get_address(postal_code, romaji: romaji)

    address.to_h
  end

  def self.validate_postal_code!(postal_code)
    return if postal_code.match?(/\A\d{7}\z/)

    raise InvalidPostalCodeError,
          'Invalid postal code. Please make sure the postal code is 7 digits long and only contains numbers.'
  end

  def self.get_address(postal_code, romaji: false)
    # Read from ./jp_postcodes.json (Shift JIS)
    # Format: {
    #   "2140037": {
    #     "prefecture": "神奈川県",
    #     "city": "川崎市",
    #     "ward": "多摩区",
    #     "district": "西生田"
    #   }
    data = JSON.parse(File.read(File.join(__dir__, 'jp_postcodes.json')))

    prefecture = data[postal_code]["prefecture#{'_romaji' if romaji}"]
    city = data[postal_code]["city#{'_romaji' if romaji}"]
    ward = data[postal_code]["ward#{'_romaji' if romaji}"]
    district = data[postal_code]["district#{'_romaji' if romaji}"]

    Address.new(postal_code, prefecture, city, ward, district)
  end
end
