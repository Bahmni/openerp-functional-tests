require 'spec_helper'
require 'rubygems'
require 'ooor'
require 'TestConfig'

describe Ooor do
  before(:all) do
    @ooor = TestConfig.new().ooor
  end

  describe "Cleanup Data" do

    it "should delete  product" do
      p_id=ProductProduct.search([['name', 'ilike', 'testProduct1']])[0]
      p = ProductProduct.find(p_id)
      p.destroy()
    end

    it "should delete customer" do
      p_id=ResPartner.search([['name', 'ilike', 'testCustomer1']])[0]
      p = ResPartner.find(p_id)
      p.destroy()
    end
  end
end