require 'test_helper'

module SelecaoAdmin
  class OnlineLectureCodesControllerTest < ActionController::TestCase
    setup do
      @online_lecture_code = online_lecture_codes(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:online_lecture_codes)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create online_lecture_code" do
      assert_difference('OnlineLectureCode.count') do
        post :create, :online_lecture_code => { :code => @online_lecture_code.code }
      end
  
      assert_redirected_to online_lecture_code_path(assigns(:online_lecture_code))
    end
  
    test "should show online_lecture_code" do
      get :show, :id => @online_lecture_code
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @online_lecture_code
      assert_response :success
    end
  
    test "should update online_lecture_code" do
      put :update, :id => @online_lecture_code, :online_lecture_code => { :code => @online_lecture_code.code }
      assert_redirected_to online_lecture_code_path(assigns(:online_lecture_code))
    end
  
    test "should destroy online_lecture_code" do
      assert_difference('OnlineLectureCode.count', -1) do
        delete :destroy, :id => @online_lecture_code
      end
  
      assert_redirected_to online_lecture_codes_path
    end
  end
end
