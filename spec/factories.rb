class User
  attr_accessor :id, :name, :email, :password
end

FactoryGirl.define do
  factory :user do
    id       "100006629106230"
    name     "Michael Smolenski"
    #email    "michael.smolenski.junk@gmail.com"
    email    "jwsqkdk_chengescumansonbergskysteinsenwitz_1382061434@tfbnw.net"
    password "Trustme8"
    #id       "100006629106230"
    #name     "Susan Amffbiajfbcj Fallerson"
    #email    "srhhupw_fallerson_1378332932@tfbnw.net"
    #password "Trustno1"
  end
end