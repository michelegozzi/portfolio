require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = create(:user)
  end

  test "verify right login" do
    
    
    visit("/signin")
    assert page.status_code.should == 200
    #assert_response :success

    fill_in('Email', :with => @user.email)
    fill_in('Password', :with => @user.password)
    click_button('Sign in')


    
    assert current_path.should == "/users/#{@user.id}"
    #assert_equal 'Welcome avs!', flash[:notice]
 
    # visit a restricted page
    visit("/sectors")
    assert page.status_code.should == 200
    #assert_response :success

    #save_and_open_page
  end
end
