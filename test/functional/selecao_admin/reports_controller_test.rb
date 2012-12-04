require 'test_helper'

module SelecaoAdmin
  class ReportsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
