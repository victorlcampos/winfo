FactoryGirl.define do
  factory :user do
    email                 'email@winfo.me'
    name 'derp'
    password              '12345678'
    password_confirmation '12345678'
  end
end