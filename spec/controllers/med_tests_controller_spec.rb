require 'spec_helper'

describe MedTestsController do

  login_user

  describe "GET index" do
    it "assigns all med tests as @med_tests" do
      med_test = FactoryGirl.create(:med_test)
      get :index, {}
      response.should be_success
      assigns(:med_tests).should eq([med_test])
    end
  end

  describe "create antibody" do
    it "should add antibodies to MedTest if they has been passed" do
      post :create, {med_test: {tracking_number: Time.now.to_s}, antibodies: "AA,BB,CC"}
      assigns(:med_test).antibodies.count.should eq(3)
    end

    [nil, ""].each do |parameter|
      it "should not add antibodies to MedTest if nil/empty string been passed" do
        post :create, {med_test: {tracking_number: Time.now.to_s}, antibodies: parameter}
        assigns(:med_test).antibodies.count.should eq(0)
      end
    end

  end

end
