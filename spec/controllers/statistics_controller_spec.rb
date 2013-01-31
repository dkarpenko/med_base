require 'spec_helper'

describe StatisticsController do

  describe 'GET index' do
    it 'assigns all statistics as @statistics' do
      test_statistic = FactoryGirl.create :statistic
      get :index, {}
      assigns(:statistics).should eq([test_statistic])
    end
  end

end
