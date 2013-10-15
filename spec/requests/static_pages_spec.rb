require 'spec_helper'

describe 'home page' do
  it 'should log user in' do
    visit '/'
    page.should have_content('Facebook')
  end
end