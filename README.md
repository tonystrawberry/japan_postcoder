<p align="center">
  <a>
    <img src="https://static.vecteezy.com/system/resources/thumbnails/004/587/562/small_2x/doodle-freehand-drawing-of-japan-map-free-vector.jpg" width="60" />
  </a>
</p>
<h1 align="center">
  🇯🇵 Japan Postcoder
</h1>

Japan Postcoder is a library that allows you to get the address of a location in Japan from its postcode.
It will help you get the prefecture, city, ward and street name from a postcode.

All the location data is provided by the [Japan Post](https://www.post.japanpost.jp/zipcode/download.html).

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
address = JapanPostcoder.to_hash(postcode)

puts address # => {:prefecture=>"神奈川県", :city=>"川崎市", :ward=>"多摩区", :district=>"菅仙谷町"}
```

# 💪 Contributing

If you notice a bug or want to add a new feature, please open an issue or submit a pull request.
Thank you and enjoy!

# 📝 License

This project is free to use under the terms of the MIT License.
