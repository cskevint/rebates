require 'test_helper'

class RebatesControllerTest < ActionController::TestCase
  setup do
    @rebate = rebates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rebates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rebate" do
    assert_difference('Rebate.count') do
      post :create, rebate: { additional_details: @rebate.additional_details, amount: @rebate.amount, available_date: @rebate.available_date, description: @rebate.description, exclusions: @rebate.exclusions, exhausted_flag: @rebate.exhausted_flag, expiration_date: @rebate.expiration_date, name: @rebate.name, rebate_url: @rebate.rebate_url, rebateable_id: @rebate.rebateable_id, rebateable_type: @rebate.rebateable_type, requirements: @rebate.requirements, units: @rebate.units }
    end

    assert_redirected_to rebate_path(assigns(:rebate))
  end

  test "should show rebate" do
    get :show, id: @rebate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rebate
    assert_response :success
  end

  test "should update rebate" do
    put :update, id: @rebate, rebate: { additional_details: @rebate.additional_details, amount: @rebate.amount, available_date: @rebate.available_date, description: @rebate.description, exclusions: @rebate.exclusions, exhausted_flag: @rebate.exhausted_flag, expiration_date: @rebate.expiration_date, name: @rebate.name, rebate_url: @rebate.rebate_url, rebateable_id: @rebate.rebateable_id, rebateable_type: @rebate.rebateable_type, requirements: @rebate.requirements, units: @rebate.units }
    assert_redirected_to rebate_path(assigns(:rebate))
  end

  test "should destroy rebate" do
    assert_difference('Rebate.count', -1) do
      delete :destroy, id: @rebate
    end

    assert_redirected_to rebates_path
  end
end
