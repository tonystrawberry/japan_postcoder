# frozen_string_literal: true

require_relative "version"
require_relative "address"

require "json"

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

  private

  def self.validate_postal_code!(postal_code)
    raise InvalidPostalCodeError.new("Invalid postal code. Please make sure the postal code is 7 digits long and only contains numbers.") unless postal_code.match?(/\A\d{7}\z/)
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
    data = JSON.parse(File.read(File.join(__dir__, "jp_postcodes.json")))

    if romaji
      Address.new(
        postal_code,
        data[postal_code]["prefecture_romaji"],
        data[postal_code]["city_romaji"],
        data[postal_code]["ward_romaji"],
        data[postal_code]["district_romaji"]
      )
    else
      Address.new(
        postal_code,
        data[postal_code]["prefecture"],
        data[postal_code]["city"],
        data[postal_code]["ward"],
        data[postal_code]["district"]
      )
    end
  end
end
