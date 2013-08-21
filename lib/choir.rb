require 'httparty'

module Choir
  class API

    VERSION = "0.0.2"

    include HTTParty
    base_uri 'https://api.choir.io'

    def post_event (key, data)

      raise ArgumentError, "Must specify a key" if key.nil?
      raise ArgumentError, "Must specify a sound" if data[:sound].nil?

      self.class.post( "/#{key}", body: data )

    end

  end

  class API::Error < ::StandardError; end
end
