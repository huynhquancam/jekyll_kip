# jekyll-kip

Jekyll KIP helps you cross-post your Jekyll to [Kipalog](http://kipalog.com)

## Installation

Add this line to your Gemfile

```ruby
gem 'jekyll_kip', group: [:jekyll_plugins]
```

And then execute:

```bash
$ bundle install
```

## Usage

Add this to `_config.yml`

```yaml
kipalog_api_token: YOUR-API-KEY-FROM-KIPALOG
```

then execute this command

```
$ bundle exec jekyll kip your-post-slug-here
```

## Development

1. Clone this repository.
2. Run `bundle install`.
3. Run `bundle exec rake test` to run test.
4. Write your features and submit a pull request (with your test)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jekyll_kip. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

The MIT License (MIT)

Copyright (c) 2016 Cam Huynh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

