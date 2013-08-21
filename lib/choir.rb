require 'httparty'

module Choir
  class API

    VERSION = "0.0.1"

    include HTTParty

    attr_accessor :stream_id, :stream


    def initialize ( opts = { } )

      self.class.base_uri    'https://api.choir.io'
      self.stream_id      =  opts[:stream_id]

      self.stream = []

    end


    def get_stream stream_id

      self.stream    = []
      self.stream_id = stream_id

      resp = self.class.get( "/stream/#{@stream_id}" )
      raise Error.new( "Wrong Stream ID" ) unless resp.code == 200

      self.stream = resp.parsed_response.to_a[0][1]

    end


    def post_event (key, data)

      raise ArgumentError, "Must specify a key" if key.nil?
      raise ArgumentError, "Must specify a sound" if data[:sound].nil?

      self.class.post( "/#{key}", body: data )

    end

  end

  class API::Error < ::StandardError; end
end
