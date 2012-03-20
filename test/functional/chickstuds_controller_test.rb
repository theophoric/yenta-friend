require 'test_helper'

class ChickstudsControllerTest < ActionController::TestCase
  setup do
    @chickstud = chickstuds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chickstuds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chickstud" do
    assert_difference('Chickstud.count') do
      post :create, :chickstud => @chickstud.attributes
    end

    assert_redirected_to chickstud_path(assigns(:chickstud))
  end

  test "should show chickstud" do
    get :show, :id => @chickstud
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chickstud
    assert_response :success
  end

  test "should update chickstud" do
    put :update, :id => @chickstud, :chickstud => @chickstud.attributes
    assert_redirected_to chickstud_path(assigns(:chickstud))
  end

  test "should destroy chickstud" do
    assert_difference('Chickstud.count', -1) do
      delete :destroy, :id => @chickstud
    end

    assert_redirected_to chickstuds_path
  end
end
