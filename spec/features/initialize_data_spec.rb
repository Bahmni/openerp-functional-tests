require 'spec_helper'
require 'rubygems'
require 'ooor'
require 'OpenERPProperties'

describe Ooor do
  before(:all) do
    @ooor = OpenERPProperties.new().ooor
  end

  describe "Basic creations" do

    it "should be able to create a product" do
      p = ProductProduct.new(:name => "testProduct1", :categ_id => 1)
      p.create()
      ProductProduct.find(p.id).categ_id.id.should == 1
    end

    it "should be able to create a customer" do
      p = ResPartner.new(:name => "testCustomer1")
      p.create()
      ResPartner.find(p.id).name.should == "testCustomer1"
    end
  end
end