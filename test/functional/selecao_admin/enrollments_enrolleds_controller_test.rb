require 'test_helper'

module SelecaoAdmin
  class EnrollmentsEnrolledsControllerTest < ActionController::TestCase
    setup do
      @enrollments_enrolled = enrollments_enrolleds(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:enrollments_enrolleds)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create enrollments_enrolled" do
      assert_difference('EnrollmentsEnrolled.count') do
        post :create, :enrollments_enrolled => {  }
      end
  
      assert_redirected_to enrollments_enrolled_path(assigns(:enrollments_enrolled))
    end
  
    test "should show enrollments_enrolled" do
      get :show, :id => @enrollments_enrolled
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @enrollments_enrolled
      assert_response :success
    end
  
    test "should update enrollments_enrolled" do
      put :update, :id => @enrollments_enrolled, :enrollments_enrolled => {  }
      assert_redirected_to enrollments_enrolled_path(assigns(:enrollments_enrolled))
    end
  
    test "should destroy enrollments_enrolled" do
      assert_difference('EnrollmentsEnrolled.count', -1) do
        delete :destroy, :id => @enrollments_enrolled
      end
  
      assert_redirected_to enrollments_enrolleds_path
    end
  end
end
