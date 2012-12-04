require 'test_helper'

module SelecaoAdmin
  class CoursePrerequisitesControllerTest < ActionController::TestCase
    setup do
      @course_prerequisite = course_prerequisites(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:course_prerequisites)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create course_prerequisite" do
      assert_difference('CoursePrerequisite.count') do
        post :create, :course_prerequisite => { :description => @course_prerequisite.description, :title => @course_prerequisite.title }
      end
  
      assert_redirected_to course_prerequisite_path(assigns(:course_prerequisite))
    end
  
    test "should show course_prerequisite" do
      get :show, :id => @course_prerequisite
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @course_prerequisite
      assert_response :success
    end
  
    test "should update course_prerequisite" do
      put :update, :id => @course_prerequisite, :course_prerequisite => { :description => @course_prerequisite.description, :title => @course_prerequisite.title }
      assert_redirected_to course_prerequisite_path(assigns(:course_prerequisite))
    end
  
    test "should destroy course_prerequisite" do
      assert_difference('CoursePrerequisite.count', -1) do
        delete :destroy, :id => @course_prerequisite
      end
  
      assert_redirected_to course_prerequisites_path
    end
  end
end
