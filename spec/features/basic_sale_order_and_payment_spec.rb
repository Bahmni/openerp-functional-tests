require 'spec_helper'
require 'TestConfig'

describe "Test OpenERP Sale Order and Payment Flow" do

  before(:each)  do
    p_ids=ProductProduct.search([['name', 'ilike', 'testProduct1']])
    if(!p_ids.any?)
      ProductProduct.new(:name => "testProduct1", :categ_id => 1).create()
      ResPartner.new(:name => "testCustomer1").create()
    end
  end

  after(:each)  do
    #p_id=ProductProduct.search([['name', 'ilike', 'testProduct1']])[0]
    #p = ProductProduct.find(p_id)
    #p.destroy()
    #
    #p_id=ResPartner.search([['name', 'ilike', 'testCustomer1']])[0]
    #p = ResPartner.find(p_id)
    #p.destroy()
  end

  it "calculates total balance", :js => true do
      log_in()
      navigate_to_sale_order()
      #create_sale_order()
      #pay()
      #expect(page).to have_content("Total Balance")
    end
  end

  def log_in
    props = TestConfig.new()
    visit props.url
    fill_in('login', :with => props.username)
    fill_in('password', :with => props.password)
    select props.database, :from => 'db'
    click_button('Log in')
   end

  def navigate_to_sale_order
    sleep(2)
    click_link('Sales')
    sleep(1)
    click_link('Sales Orders')
    sleep(3)
    within('.oe_list_buttons') { click_button('Create') }
  end

  def create_sale_order
      select_customer()
      sleep(4)
      select_product()
      sleep(1)
      click_button('Confirm Sale')
      sleep(1)
  end

  def pay
    sleep(15)
    #print(page.html)
    #within('.oe_form_sheetbg') {find_field('journal_id').find(:option,'Cash (INR)').click}
    #within('.oe_form_sheetbg') {fill_in('Paid Amount', :with => "450.00")}
    ##find('select', :text => 'Payment Method').set "Cash (INR)"
    #find_field('Payment Method').set  "RSBY (INR)"
    #find(:xpath, '//select[@name="journal_id"]//input[@class="ui-autocomplete-input"]').set "RSBY (INR)"
    #find('select', :name => 'journal_id').set "RSBY (INR)"
    #find_field('restrictions__rating_movies').find('option[selected]').text
    #within('.oe_form_sheetbg') {find_field('journal_id').find(:option,'Cash (INR)').click}
    #sleep(5)

  end

  def select_customer
    customer_selector = '.ui-menu-item a:contains(\"testCustomer1\")'
    within('.oe_form_sheetbg') { fill_in 'Customer', :with => 'testCustomer1' }
    sleep(1)
    page.execute_script " $('#{customer_selector}').
          trigger(\"mouseenter\").click();"
  end

  def select_product
    click_link('Add an item')
    product_selector = '.ui-menu-item a:contains(\"testProduct1\")'
    find(:xpath, '//span[@data-fieldname="product_id"]//input[@class="ui-autocomplete-input"]').set "testProduct1"
    page.execute_script " $('#{product_selector}').
          trigger(\"mouseenter\").click();"
  end
