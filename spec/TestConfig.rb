require 'rubygems'
require 'ooor'
require 'yaml'


class TestConfig

  attr_reader :url,:rpc_url,:db_password,:username,:password,:database,:firefox_path ,:ooor

  def initialize

    @CONFIG = YAML.load_file(File.join(File.dirname(__FILE__),"config"))

    @url = @CONFIG['url']
    @rpc_url = @CONFIG['rpc_url']
    @db_password = @CONFIG['db_password']
    @username = @CONFIG['username']
    @password = @CONFIG['password']
    @database = @CONFIG['database']
    @firefox_path = @CONFIG['firefox_path']
    @ooor = Ooor.new(:url => @rpc_url, :database => @database,:username => @username, :password => @password)
  end

 end


