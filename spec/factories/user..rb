FactoryBot.define do
  factory :admin do |u|
    u.name { 'admin' }
    u.password { 'password' }
    u.password_confirmation { 'password' }
    u.email { 'admin@gmail.com' }
    u.role { :admin }
  end

  factory :user do |u|
    u.name { 'user' }
    u.password { 'password' }
    u.password_confirmation { 'password' }
    u.email { 'user@gmail.com' }
    u.role { :regular }
  end
end
