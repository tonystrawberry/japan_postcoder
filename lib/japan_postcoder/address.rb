# frozen_string_literal: true

## Class for Japanese Address
## Has attributes for postcode, prefecture, city, ward and district
#
class JapanPostcoder::Address
  attr_accessor :postcode, :prefecture, :city, :ward, :district

  # Initialize the address with postcode, prefecture, city, ward and district
  def initialize(postcode, prefecture, city, ward, district)
    @postcode = postcode
    @prefecture = prefecture
    @city = city
    @ward = ward
    @district = district
  end

  # Returns the full address as a string
  def to_s(romaji: false)
    if romaji
      "#{@prefecture} #{@city} #{@ward} #{@district}"
    else
      "#{@prefecture}#{@city}#{@ward}#{@district}"
    end
  end

  # Returns the full address as a hash
  def to_h
    {
      postcode: @postcode,
      prefecture: @prefecture,
      city: @city,
      ward: @ward,
      district: @district
    }
  end
end
