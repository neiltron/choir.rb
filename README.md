# Choir

Ruby API wrapper for Choir.io. Fetch stream and post events.

## Installation

Add this line to your application's Gemfile:

    gem 'choir'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install choir

## Usage

    require 'choir'

    choir = Choir::API.new

    choir.get_stream(<your stream id>)
    choir.post_event(<your source key>, { sound: "g/1", label: "hello", text: "hello choir" })

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
