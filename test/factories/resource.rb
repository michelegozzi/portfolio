FactoryGirl.define do
  factory :resource do
    sequence(:display_name) { |n| "Resource #{n}" } 
    sequence(:file_path) { |n| "http://www.resources.com/#{n}.png" } 
    mime_type "image/png"
    project
  end
end