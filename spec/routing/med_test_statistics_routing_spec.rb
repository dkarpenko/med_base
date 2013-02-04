require 'spec_helper'

describe MedTestStatisticsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/med_test_statistics').should route_to('med_test_statistics#index')
    end

  end
end
