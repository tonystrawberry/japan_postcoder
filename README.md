<p align="center">
  <a>
    <img src="https://static.vecteezy.com/system/resources/thumbnails/004/587/562/small_2x/doodle-freehand-drawing-of-japan-map-free-vector.jpg" width="60" />
  </a>
</p>
<h1 align="center">
  🇯🇵 Japan Postcoder
</h1>

[![Tests](https://github.com/tonystrawberry/japan_postcoder/workflows/Ruby/badge.svg)](https://github.com/tonystrawberry/japan_postcoder/actions/workflows/main.yml)
<a href="https://codeclimate.com/github/tonystrawberry/japan_postcoder/maintainability"><img src="https://api.codeclimate.com/v1/badges/7362475ad52048cbbee1/maintainability" /></a>
<a href="https://codeclimate.com/github/tonystrawberry/japan_postcoder/test_coverage"><img src="https://api.codeclimate.com/v1/badges/7362475ad52048cbbee1/test_coverage" /></a>

Japan Postcoder is a library that allows you to get the address of a location in Japan from its postcode.
It will help you get the prefecture, city, ward and street name from a postcode.

All the location data is provided by the [Japan Post](https://www.post.japanpost.jp/zipcode/download.html).

Rubygems link is here: https://rubygems.org/gems/japan_postcoder

# 🏃🏻 Getting started

Start by including `japan-postcoder` in your project:

```bash
gem 'japan-postcoder'
```

Then, you can use the `JapanPostcoder` class to get the address of a location in Japan from its postcode:

# 👨🏻‍💻 Usage

You can use the `JapanPostcoder` class to get the address of a location in Japan in **string** format.
```ruby
require 'japan-postcoder'

postcode = '2140037'
address = JapanPostcoder.to_address(postcode)

puts address # => "神奈川県川崎市多摩区菅仙谷町"
```

You can also use the `JapanPostcoder` class to get the address of a location in Japan in **hash** format.
```ruby
require 'japan-postcoder'

postcode = '2140037'
address = JapanPostcoder.to_address_hash(postcode)

puts address # => {:prefecture=>"神奈川県", :city=>"川崎市", :ward=>"多摩区", :district=>"菅仙谷町"}
```

## 🇬🇧 Romaji transcription

You can use the `JapanPostcoder` class to get the address of a location in Japan in **romaji** format by using the `romaji` named argument.

```ruby
address = JapanPostcoder.to_address('2140037', romaji: true)
puts address # => "KANAGAWA KEN KAWASAKI SHI TAMA KU SUGESEN YACHO"
```

```ruby
address = JapanPostcoder.to_address_hash('2140037', romaji: true)
puts address # => {:prefecture=>"KANAGAWA KEN", :city=>"KAWASAKI SHI", :ward=>"TAMA KU", :district=>"SUGESEN YACHO"}
```

# 💪 Contributing

If you notice a bug or want to add a new feature, please open an issue or submit a pull request.
Thank you and enjoy!

# 📝 License

This project is free to use under the terms of the MIT License.
