require 'test_helper'

module SelecaoAdmin
  class EntryMailsControllerTest < ActionController::TestCase
    setup do
      @entry_mail = entry_mails(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:entry_mails)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create entry_mail" do
      assert_difference('EntryMail.count') do
        post :create, :entry_mail => { :recipient_user_id => @entry_mail.recipient_user_id, :sender_user_id => @entry_mail.sender_user_id }
      end
  
      assert_redirected_to entry_mail_path(assigns(:entry_mail))
    end
  
    test "should show entry_mail" do
      get :show, :id => @entry_mail
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @entry_mail
      assert_response :success
    end
  
    test "should update entry_mail" do
      put :update, :id => @entry_mail, :entry_mail => { :recipient_user_id => @entry_mail.recipient_user_id, :sender_user_id => @entry_mail.sender_user_id }
      assert_redirected_to entry_mail_path(assigns(:entry_mail))
    end
  
    test "should destroy entry_mail" do
      assert_difference('EntryMail.count', -1) do
        delete :destroy, :id => @entry_mail
      end
  
      assert_redirected_to entry_mails_path
    end
  end
end
