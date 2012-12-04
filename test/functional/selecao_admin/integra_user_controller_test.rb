require 'test_helper'

module SelecaoAdmin
  class IntegraUserControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
