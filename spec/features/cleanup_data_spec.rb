require 'spec_helper'
require 'rubygems'
require 'ooor'
require 'OpenERPProperties'


describe Ooor do
  before(:all) do
    @ooor = OpenERPProperties.new().ooor
  end

  describe "Cleanup Data" do

    it "delete  product" do
      p_id=ProductProduct.search([['name', 'ilike', 'testProduct1']])[0]
      p = ProductProduct.find(p_id)
      p.destroy()
    end

    it "delete test customer" do
      p_id=ResPartner.search([['name', 'ilike', 'testCustomer1']])[0]
      p = ResPartner.find(p_id)
      p.destroy()
    end
  end
end