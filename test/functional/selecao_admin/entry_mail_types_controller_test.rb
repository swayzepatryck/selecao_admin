require 'test_helper'

module SelecaoAdmin
  class EntryMailTypesControllerTest < ActionController::TestCase
    setup do
      @entry_mail_type = entry_mail_types(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:entry_mail_types)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create entry_mail_type" do
      assert_difference('EntryMailType.count') do
        post :create, :entry_mail_type => { :mail_text => @entry_mail_type.mail_text, :title => @entry_mail_type.title }
      end
  
      assert_redirected_to entry_mail_type_path(assigns(:entry_mail_type))
    end
  
    test "should show entry_mail_type" do
      get :show, :id => @entry_mail_type
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @entry_mail_type
      assert_response :success
    end
  
    test "should update entry_mail_type" do
      put :update, :id => @entry_mail_type, :entry_mail_type => { :mail_text => @entry_mail_type.mail_text, :title => @entry_mail_type.title }
      assert_redirected_to entry_mail_type_path(assigns(:entry_mail_type))
    end
  
    test "should destroy entry_mail_type" do
      assert_difference('EntryMailType.count', -1) do
        delete :destroy, :id => @entry_mail_type
      end
  
      assert_redirected_to entry_mail_types_path
    end
  end
end
