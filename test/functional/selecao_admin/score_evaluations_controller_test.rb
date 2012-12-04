require 'test_helper'

module SelecaoAdmin
  class ScoreEvaluationsControllerTest < ActionController::TestCase
    setup do
      @score_evaluation = score_evaluations(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:score_evaluations)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create score_evaluation" do
      assert_difference('ScoreEvaluation.count') do
        post :create, :score_evaluation => { :title => @score_evaluation.title }
      end
  
      assert_redirected_to score_evaluation_path(assigns(:score_evaluation))
    end
  
    test "should show score_evaluation" do
      get :show, :id => @score_evaluation
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @score_evaluation
      assert_response :success
    end
  
    test "should update score_evaluation" do
      put :update, :id => @score_evaluation, :score_evaluation => { :title => @score_evaluation.title }
      assert_redirected_to score_evaluation_path(assigns(:score_evaluation))
    end
  
    test "should destroy score_evaluation" do
      assert_difference('ScoreEvaluation.count', -1) do
        delete :destroy, :id => @score_evaluation
      end
  
      assert_redirected_to score_evaluations_path
    end
  end
end
