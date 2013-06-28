require 'rubygems'
require 'ooor'
require 'yaml'


class TestConfig

  cattr_reader :url,:rpc_url,:db_password,:username,:password,:database,:firefox_path

  def self.init

    @@CONFIG = YAML.load_file(File.join(File.dirname(__FILE__),"config"))

    @@url = @@CONFIG['url']
    @@rpc_url = @@CONFIG['rpc_url']
    @@db_password = @@CONFIG['db_password']
    @@username = @@CONFIG['username']
    @@password = @@CONFIG['password']
    @@database = @@CONFIG['database']
    @@firefox_path = @@CONFIG['firefox_path']
    Ooor.new(:url => @@rpc_url, :database => @@database,:username => @@username, :password => @@password)
  end
end


