require 'test_helper'

class MedTestsControllerTest < ActionController::TestCase
  setup do
    @med_test = med_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:med_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create med_test" do
    assert_difference('MedTest.count') do
      post :create, med_test: { conclusion: @med_test.conclusion, description: @med_test.description, doctor_name: @med_test.patient_name, test_date: @med_test.test_date, tracking_number: @med_test.tracking_number }
    end

    assert_redirected_to med_test_path(assigns(:med_test))
  end

  test "should show med_test" do
    get :show, id: @med_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @med_test
    assert_response :success
  end

  test "should update med_test" do
    put :update, id: @med_test, med_test: { conclusion: @med_test.conclusion, description: @med_test.description, doctor_name: @med_test.patient_name, test_date: @med_test.test_date, tracking_number: @med_test.tracking_number }
    assert_redirected_to med_test_path(assigns(:med_test))
  end

  test "should destroy med_test" do
    assert_difference('MedTest.count', -1) do
      delete :destroy, id: @med_test
    end

    assert_redirected_to med_tests_path
  end
end
