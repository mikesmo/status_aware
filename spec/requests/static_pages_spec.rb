require 'spec_helper'

describe 'home page' do
  it 'should log user in' do
    visit '/'

    fill_in 'Email or Phone', :with => 'michael.smolenski.junk@gmail.com'
    fill_in 'Password', :with => 'Trustme8'
    click_button "Log In"

    page.should have_content('Facebook')
  end
end