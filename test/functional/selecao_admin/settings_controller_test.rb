require 'test_helper'

module SelecaoAdmin
  class SettingsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
