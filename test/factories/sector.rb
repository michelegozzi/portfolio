FactoryGirl.define do
  factory :sector do
    sequence(:description) { |n| "Sector #{n}" } 
    sequence(:icon_name) { |n| "icon#{n}" }
    sequence(:icon_class) { |n| "icon#{n}" }

    # sector_with_projects will create project data after the sector has been created
    factory :sector_with_projects_without_resources do
      # projects_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        projects_count 5
      end

      # the after(:create) yields two values; the sector instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |sector, evaluator|
        create_list(:project, evaluator.projects_count, sector: sector)
      end

      #after(:build) do |sector, evaluator|
      #  build_list(:project, evaluator.projects_count, :sector => sector)
      #end

      #after(:create) do |sector|
      #  sector.projects.each { |p| p.save! }
      #end
    end

    # creates a sector with projects and for every project creates resources
    factory :sector_with_projects_with_resources do
      ignore do
        projects_count 5
      end

      after(:create) do |sector, evaluator|
        create_list(:project_with_resources, evaluator.projects_count, sector: sector)
      end
    end

  end
end