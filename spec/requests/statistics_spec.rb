require 'spec_helper'

describe 'TestStatistics' do
  describe 'GET /statistics' do
    it 'should lead to test statistic index page' do
      get statistics_path
      response.status.should be(200)
    end
  end
end
