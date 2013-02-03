require 'spec_helper'

describe MedTestStatisticsController do

  login_user

  describe 'GET index' do
    it 'assigns all statistics as @statistics' do
      test_statistic = FactoryGirl.create :med_test_statistic
      get :index, {}
      assigns(:statistics).should eq([test_statistic])
    end
  end

end
