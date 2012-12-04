require 'test_helper'

module SelecaoAdmin
  class PublicationCategoriesControllerTest < ActionController::TestCase
    setup do
      @publication_category = publication_categories(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:publication_categories)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create publication_category" do
      assert_difference('PublicationCategory.count') do
        post :create, :publication_category => { :title => @publication_category.title }
      end
  
      assert_redirected_to publication_category_path(assigns(:publication_category))
    end
  
    test "should show publication_category" do
      get :show, :id => @publication_category
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, :id => @publication_category
      assert_response :success
    end
  
    test "should update publication_category" do
      put :update, :id => @publication_category, :publication_category => { :title => @publication_category.title }
      assert_redirected_to publication_category_path(assigns(:publication_category))
    end
  
    test "should destroy publication_category" do
      assert_difference('PublicationCategory.count', -1) do
        delete :destroy, :id => @publication_category
      end
  
      assert_redirected_to publication_categories_path
    end
  end
end
