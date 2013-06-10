require 'rubygems'
require 'ooor'
class OpenERPProperties

  attr_reader :url,:rpc_url, :db_password, :username, :password, :database ,:ooor

  def initialize
  @url = 'http://172.18.2.5:8069'
  @rpc_url = 'http://172.18.2.5:8069/xmlrpc'
  @db_password = 'postgres'
  @username = 'admin'
  @password = 'password'
  @database = 'Test'
  @ooor = Ooor.new(:url => @rpc_url, :database => @database,:username => @username, :password => @password)
end

 end


