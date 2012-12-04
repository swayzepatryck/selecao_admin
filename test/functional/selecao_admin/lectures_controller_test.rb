require 'test_helper'

module SelecaoAdmin
  class OnlineLecturesControllerTest < ActionController::TestCase
    setup do
      @online_lecture = online_lectures(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:online_lectures)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create online_lecture" do
      assert_difference('OnlineLecture.count') do
        post :create, :online_lecture => { :title => @online_lecture.title, :video_url => @online_lecture.video_url }
      end
  
      assert_redirected_to online_lecture_path(assigns(:online_lecture))
    end
  
    test "should show online_lecture" do
      get :show, :id => @online_lecture
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @online_lecture
      assert_response :success
    end
  
    test "should update online_lecture" do
      put :update, :id => @online_lecture, :online_lecture => { :title => @online_lecture.title, :video_url => @online_lecture.video_url }
      assert_redirected_to online_lecture_path(assigns(:online_lecture))
    end
  
    test "should destroy online_lecture" do
      assert_difference('OnlineLecture.count', -1) do
        delete :destroy, :id => @online_lecture
      end
  
      assert_redirected_to online_lectures_path
    end
  end
end
