require 'spec_helper'

describe 'home page' do
  it 'should log user in' do
    user ||= FactoryGirl.build :user
    visit '/'
    fill_in 'Email or Phone', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log In"
  end
end