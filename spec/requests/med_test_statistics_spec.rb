require 'spec_helper'

describe 'MedTestStatistics' do
  describe 'GET /statistics' do
    it 'should lead to test statistic index page' do
      get med_test_statistics_path
      response.status.should be(200)
    end
  end
end
