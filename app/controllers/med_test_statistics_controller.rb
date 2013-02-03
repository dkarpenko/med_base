class MedTestStatisticsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @statistics = MedTestStatistic.all
  end

end
