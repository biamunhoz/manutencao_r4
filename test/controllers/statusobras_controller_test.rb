require 'test_helper'

class StatusobrasControllerTest < ActionController::TestCase
  setup do
    @statusobra = statusobras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statusobras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statusobra" do
    assert_difference('Statusobra.count') do
      post :create, statusobra: { type: @statusobra.type }
    end

    assert_redirected_to statusobra_path(assigns(:statusobra))
  end

  test "should show statusobra" do
    get :show, id: @statusobra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statusobra
    assert_response :success
  end

  test "should update statusobra" do
    patch :update, id: @statusobra, statusobra: { type: @statusobra.type }
    assert_redirected_to statusobra_path(assigns(:statusobra))
  end

  test "should destroy statusobra" do
    assert_difference('Statusobra.count', -1) do
      delete :destroy, id: @statusobra
    end

    assert_redirected_to statusobras_path
  end
end
