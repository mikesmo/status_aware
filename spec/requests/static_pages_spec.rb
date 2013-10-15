require 'spec_helper'

describe 'home page' do
  it 'should log user in', :js => true do
    user ||= FactoryGirl.build :user
    visit '/'
    fill_in 'Email or Phone', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log In"

    visit '/settings?tab=applications'

    if has_content?('StatusAware_dev')
      click_link 'StatusAware_dev'
      click_link 'Remove app'
      find('input[name="ok"][type="button"]').click
      page.should_not have_content('StatusAware_dev')
    end

    Capybara.app_host = "http://apps.facebook.com"
    visit '/statusaware-dev'

    within_frame 'iframe_canvas' do
      page.should have_content('Status Aware Home Page')
    end

    find_button('Cancel').click

    within_frame 'iframe_canvas' do
      page.should have_content('Please authorise app')
      find("a:contains('authorise app')").click
    end

    find_button('Okay').click

    within_frame 'iframe_canvas' do
      page.should have_selector("#div_welcome_message", :text => "Welcome Michael")
    end
  end
end