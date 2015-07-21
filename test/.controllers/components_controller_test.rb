require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  setup do
    @component = components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component" do
    assert_difference('Component.count') do
      post :create, component: { amount: @component.amount, custom_price: @component.custom_price, custom_taxpercentage: @component.custom_taxpercentage, description: @component.description, invoice_id: @component.invoice_id, name: @component.name, price_id: @component.price_id }
    end

    assert_redirected_to component_path(assigns(:component))
  end

  test "should show component" do
    get :show, id: @component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @component
    assert_response :success
  end

  test "should update component" do
    patch :update, id: @component, component: { amount: @component.amount, custom_price: @component.custom_price, custom_taxpercentage: @component.custom_taxpercentage, description: @component.description, invoice_id: @component.invoice_id, name: @component.name, price_id: @component.price_id }
    assert_redirected_to component_path(assigns(:component))
  end

  test "should destroy component" do
    assert_difference('Component.count', -1) do
      delete :destroy, id: @component
    end

    assert_redirected_to components_path
  end
end
