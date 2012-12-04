require 'test_helper'

module SelecaoAdmin
  class EnrollmentsControllerTest < ActionController::TestCase
    setup do
      @enrollment = enrollments(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:enrollments)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create enrollment" do
      assert_difference('Enrollment.count') do
        post :create, :enrollment => { :end_date => @enrollment.end_date, :end_time => @enrollment.end_time, :number_of_vacancies => @enrollment.number_of_vacancies, :start_date => @enrollment.start_date, :start_time => @enrollment.start_time }
      end
  
      assert_redirected_to enrollment_path(assigns(:enrollment))
    end
  
    test "should show enrollment" do
      get :show, :id => @enrollment
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @enrollment
      assert_response :success
    end
  
    test "should update enrollment" do
      put :update, :id => @enrollment, :enrollment => { :end_date => @enrollment.end_date, :end_time => @enrollment.end_time, :number_of_vacancies => @enrollment.number_of_vacancies, :start_date => @enrollment.start_date, :start_time => @enrollment.start_time }
      assert_redirected_to enrollment_path(assigns(:enrollment))
    end
  
    test "should destroy enrollment" do
      assert_difference('Enrollment.count', -1) do
        delete :destroy, :id => @enrollment
      end
  
      assert_redirected_to enrollments_path
    end
  end
end
