require 'test_helper'

module SelecaoAdmin
  class EnrolledsControllerTest < ActionController::TestCase
    setup do
      @enrolled = enrolleds(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:enrolleds)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create enrolled" do
      assert_difference('Enrolled.count') do
        post :create, :enrolled => { :birth_date => @enrolled.birth_date, :fathers_name => @enrolled.fathers_name, :id_card_issuer => @enrolled.id_card_issuer, :id_card_number => @enrolled.id_card_number, :mothers_name => @enrolled.mothers_name }
      end
  
      assert_redirected_to enrolled_path(assigns(:enrolled))
    end
  
    test "should show enrolled" do
      get :show, :id => @enrolled
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @enrolled
      assert_response :success
    end
  
    test "should update enrolled" do
      put :update, :id => @enrolled, :enrolled => { :birth_date => @enrolled.birth_date, :fathers_name => @enrolled.fathers_name, :id_card_issuer => @enrolled.id_card_issuer, :id_card_number => @enrolled.id_card_number, :mothers_name => @enrolled.mothers_name }
      assert_redirected_to enrolled_path(assigns(:enrolled))
    end
  
    test "should destroy enrolled" do
      assert_difference('Enrolled.count', -1) do
        delete :destroy, :id => @enrolled
      end
  
      assert_redirected_to enrolleds_path
    end
  end
end
