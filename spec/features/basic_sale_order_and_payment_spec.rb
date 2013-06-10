require 'spec_helper'
require 'TestConfig'

describe "Test OpenERP Sale Order and Payment Flow" do

  before  do
    log_in()
    navigate_to_sale_order()
    create_sale_order()
    pay()
  end

    it "calculates total balance" do
      sleep(1)
      expect(page).to have_content("-450")
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
    click_link('Sales')
    click_link('Sales Orders')
    sleep(3)
    within('.oe_list_buttons') { click_button('Create') }
  end

  def create_sale_order
      select_customer()
      select_product()
      click_button('Confirm Sale')
    end

  def pay
    sleep(2)
    fill_in('Paid Amount', :with => "450.00")
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
