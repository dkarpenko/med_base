require 'spec_helper'

describe MedTestsController do

  login_user

  def valid_attributes
    {:test_date => "2012-12-01", :tracking_number => "123456-78/12"}
  end

  describe "GET index" do
    it "assigns all med tests as @med_tests" do
      med_test = MedTest.create! valid_attributes
      get :index, {}
      response.should be_success
      assigns(:med_tests).should eq([med_test])
    end
  end

end
