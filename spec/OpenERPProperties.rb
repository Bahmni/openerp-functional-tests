require 'rubygems'
require 'ooor'
class OpenERPProperties

  attr_reader :url,:rpc_url, :db_password, :username, :password, :database ,:ooor

  def initialize
  @url = 'http://localhost:8089'
  @rpc_url = 'http://localhost:8089/xmlrpc'
  @db_password = 'postgres'
  @username = 'admin'
  @password = 'password'
  @database = 'openerp2'
  @ooor = Ooor.new(:url => @rpc_url, :database => @database,:username => @username, :password => @password)
end

 end


