desc 'Updating MedTests statistic'
task :update_statistic => :environment do
  MedStatistic::StatisticUpdater.refresh_statistic_data
end
