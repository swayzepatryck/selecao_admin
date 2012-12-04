require 'test_helper'

module SelecaoAdmin
  class EnrolledScoresControllerTest < ActionController::TestCase
    setup do
      @enrolled_score = enrolled_scores(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:enrolled_scores)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create enrolled_score" do
      assert_difference('EnrolledScore.count') do
        post :create, :enrolled_score => { :score => @enrolled_score.score }
      end
  
      assert_redirected_to enrolled_score_path(assigns(:enrolled_score))
    end
  
    test "should show enrolled_score" do
      get :show, :id => @enrolled_score
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @enrolled_score
      assert_response :success
    end
  
    test "should update enrolled_score" do
      put :update, :id => @enrolled_score, :enrolled_score => { :score => @enrolled_score.score }
      assert_redirected_to enrolled_score_path(assigns(:enrolled_score))
    end
  
    test "should destroy enrolled_score" do
      assert_difference('EnrolledScore.count', -1) do
        delete :destroy, :id => @enrolled_score
      end
  
      assert_redirected_to enrolled_scores_path
    end
  end
end
