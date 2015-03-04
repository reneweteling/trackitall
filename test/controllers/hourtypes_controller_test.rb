require 'test_helper'

class HourtypesControllerTest < ActionController::TestCase
  setup do
    @hourtype = hourtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hourtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hourtype" do
    assert_difference('Hourtype.count') do
      post :create, hourtype: { billable: @hourtype.billable, name: @hourtype.name, price_id: @hourtype.price_id }
    end

    assert_redirected_to hourtype_path(assigns(:hourtype))
  end

  test "should show hourtype" do
    get :show, id: @hourtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hourtype
    assert_response :success
  end

  test "should update hourtype" do
    patch :update, id: @hourtype, hourtype: { billable: @hourtype.billable, name: @hourtype.name, price_id: @hourtype.price_id }
    assert_redirected_to hourtype_path(assigns(:hourtype))
  end

  test "should destroy hourtype" do
    assert_difference('Hourtype.count', -1) do
      delete :destroy, id: @hourtype
    end

    assert_redirected_to hourtypes_path
  end
end
