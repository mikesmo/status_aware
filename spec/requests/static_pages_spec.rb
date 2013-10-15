require 'spec_helper'

describe 'home page' do
  it 'should log user in' do
    Capybara.save_and_open_page_path = 'screenshots/'
    visit '/'

    fill_in 'Email or Phone', :with => 'michael.smolenski.junk@gmail.com'
    fill_in 'Password', :with => 'Trustme8'
    click_button "Log In"


    #screenshot_and_save_page

    #page.should have_content('Facebook')
  end
end