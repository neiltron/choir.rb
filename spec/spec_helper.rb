$:.push File.expand_path("../lib", __FILE__)

require 'choir'
require 'fakeweb'

FakeWeb.allow_net_connect = false