require 'test_helper'

module SelecaoAdmin
  class StudentQuotaControllerTest < ActionController::TestCase
    setup do
      @student_quotum = student_quota(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:student_quota)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create student_quotum" do
      assert_difference('StudentQuotum.count') do
        post :create, :student_quotum => { :abbreviation => @student_quotum.abbreviation, :title => @student_quotum.title }
      end
  
      assert_redirected_to student_quotum_path(assigns(:student_quotum))
    end
  
    test "should show student_quotum" do
      get :show, :id => @student_quotum
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @student_quotum
      assert_response :success
    end
  
    test "should update student_quotum" do
      put :update, :id => @student_quotum, :student_quotum => { :abbreviation => @student_quotum.abbreviation, :title => @student_quotum.title }
      assert_redirected_to student_quotum_path(assigns(:student_quotum))
    end
  
    test "should destroy student_quotum" do
      assert_difference('StudentQuotum.count', -1) do
        delete :destroy, :id => @student_quotum
      end
  
      assert_redirected_to student_quota_path
    end
  end
end
