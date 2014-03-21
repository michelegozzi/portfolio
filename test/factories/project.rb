FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" } 
    sequence(:description) { |n| "Lorem ipsum #{n}" }
    sequence(:url) { |n| "http://www.project#{n}.com/" } 
    sector

    factory :project_with_resources do
      ignore do
        resources_count 3
      end

      after(:create) do |project, evaluator|
        create_list(:resource, evaluator.resources_count, project: project)
      end
    end
  end

  
end