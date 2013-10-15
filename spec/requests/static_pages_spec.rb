require 'spec_helper'

describe 'home page' do
  it 'should log user in' do
    user ||= FactoryGirl.build :user
    visit '/'
  end
end