require 'test_helper'

module SelecaoAdmin
  class EntryProcessesControllerTest < ActionController::TestCase
    setup do
      @entry_process = entry_processes(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:entry_processes)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create entry_process" do
      assert_difference('EntryProcess.count') do
        post :create, :entry_process => { :name => @entry_process.name }
      end
  
      assert_redirected_to entry_process_path(assigns(:entry_process))
    end
  
    test "should show entry_process" do
      get :show, :id => @entry_process
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @entry_process
      assert_response :success
    end
  
    test "should update entry_process" do
      put :update, :id => @entry_process, :entry_process => { :name => @entry_process.name }
      assert_redirected_to entry_process_path(assigns(:entry_process))
    end
  
    test "should destroy entry_process" do
      assert_difference('EntryProcess.count', -1) do
        delete :destroy, :id => @entry_process
      end
  
      assert_redirected_to entry_processes_path
    end
  end
end
