FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" } 
    sequence(:description) { |n| "Lorem ipsum #{n}" }
    sequence(:url) { |n| "http://www.project#{n}.com/" } 
    sector
  end
end