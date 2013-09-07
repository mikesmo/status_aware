require 'spec_helper'

describe 'home page' do
  it 'welcomes the user', :js => true do
    user ||= FactoryGirl.build :user
    visit '/'
    unless page.has_content?('Log In')
      visit 'logout.php'
    end
    fill_in 'Email or Phone', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log In"
    page.should have_content('Welcome to Facebook, Susan.')
  end
end