namespace :medbase do

  desc 'Initialize statistic data'
  task :initialize_data => :environment do
    MedStatistic::StatisticUpdater.refresh_statistic_data
  end


end