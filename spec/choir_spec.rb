require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe Choir::API do

  before(:all) do
    @api = Choir::API.new

    FakeWeb.register_uri(:get, "https://api.choir.io/stream/mystreamid", :body => File.join(File.dirname(__FILE__), 'fixtures', 'messages.json'), :content_type => "application/json")
    FakeWeb.register_uri(:get, "https://api.choir.io/stream/wrongstreamid", :status => ["404"])
    FakeWeb.register_uri(:post, "https://api.choir.io/myeventid", :status => ["201"])

  end

  describe "get_stream" do

    it "throws an error if stream not found" do

      expect{ @api.get_stream( 'wrongstreamid' ) }.to raise_error(Choir::API::Error)

    end

    it "populates stream with an array of messages" do

      @api.get_stream( 'mystreamid' )
      @api.stream.count == 1

    end
  end


  describe "post_event" do

    it "returns status 201 after posting an event" do

      resp = @api.post_event( 'myeventid', { :sound => "g/1", :label => "hello", :text  => "hello choir" } )
      resp.code.should == 201

    end

    it "throws an argument error if no sound is specified" do

      expect{ resp = @api.post_event( 'myeventid', {} ) }.to raise_error(ArgumentError)

    end

    it "throws an argument error if no key is specified" do

      #this is pretty much the same as the no sound test
      expect{ resp = @api.post_event( {} ) }.to raise_error(ArgumentError)

    end

  end

end