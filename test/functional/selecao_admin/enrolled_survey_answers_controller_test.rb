require 'test_helper'

module SelecaoAdmin
  class EnrolledSurveyAnswersControllerTest < ActionController::TestCase
    setup do
      @enrolled_survey_answer = enrolled_survey_answers(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:enrolled_survey_answers)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create enrolled_survey_answer" do
      assert_difference('EnrolledSurveyAnswer.count') do
        post :create, :enrolled_survey_answer => { :other_option => @enrolled_survey_answer.other_option }
      end
  
      assert_redirected_to enrolled_survey_answer_path(assigns(:enrolled_survey_answer))
    end
  
    test "should show enrolled_survey_answer" do
      get :show, :id => @enrolled_survey_answer
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @enrolled_survey_answer
      assert_response :success
    end
  
    test "should update enrolled_survey_answer" do
      put :update, :id => @enrolled_survey_answer, :enrolled_survey_answer => { :other_option => @enrolled_survey_answer.other_option }
      assert_redirected_to enrolled_survey_answer_path(assigns(:enrolled_survey_answer))
    end
  
    test "should destroy enrolled_survey_answer" do
      assert_difference('EnrolledSurveyAnswer.count', -1) do
        delete :destroy, :id => @enrolled_survey_answer
      end
  
      assert_redirected_to enrolled_survey_answers_path
    end
  end
end
