require 'test_helper'
require 'database_cleaner'
include ApplicationHelper

class StaticPagesControllerTest < ActionController::TestCase

  # before
  def setup
    DatabaseCleaner.strategy = :truncation
    # then, whenever you need to clean the DB
    DatabaseCleaner.clean
    #FactoryGirl.create(:sector)
    @sectors = FactoryGirl.create_list(:sector_with_projects, 3)
    #assert_equal @sectors.count, 3
    #@sector.each do |s|
    #  assert_equal s.projects.count, 5
    #end
  end
 
  # after
  def teardown
  end

  test "should respond" do
    get :home
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_select 'title', full_title('Michele Gozzi - Portfolio')
  end


  test "should have nav-tabs with 3 tabs" do
    get :home
    assert_select "ul#pTab" do
      assert_select "li", 3
    end

    assert_select "div.tab-pane" do |elements|
      assert_equal elements.count, 3
    end
  end

  test "should have some projects for every tab" do
    get :home

    assert_select "div.tab-pane" do |tabs|
      tabs.each do |tab|
        assert_select tab, "div.container-fluid div.row div h2", 5
      end
    end
    
    assert_select "div.tab-pane" do |tabs|
      tabs.each do |tab|
        assert_select tab, "div.container-fluid", 5 do |projects|
          projects.each do |project|
            assert_select project, "div.row", 2 do |project_details|
              # verify the project title
              assert_select project_details[0], "div h2"
              # verify the project description
              assert_select project_details[1], "div div.panel" do |project_info|
                project_info.first do |pi|
                  assert_select pi, "div.panel-heading h3"
                  assert_select pi, "div.panel-body"
                  sassert_select pi, "div.panel-footer a"
                end
              end
            end # of project details
          end # of project
        end # of projects
      end # of tab
    end # of tabs

         # project_details.each do |element|
    #        assert element.children.count > 0
    #      end
    #    end
      #end
    #end

    assert_select "h2", :minimum => 1
  end



  #test "should get index" do
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:posts)
  #end


end
