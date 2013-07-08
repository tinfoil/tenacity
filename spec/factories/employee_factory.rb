FactoryGirl.define do
  factory :employee, class: Employee do
    first_name { 'John' }
    last_name { 'Gerhardt' }
    firm
  end
end