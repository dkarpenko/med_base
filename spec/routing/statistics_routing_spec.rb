require 'spec_helper'

describe StatisticsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/statistics').should route_to('statistics#index')
    end

  end
end
