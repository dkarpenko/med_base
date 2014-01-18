desc 'Updating MedTests statistic'
task :update_statistic => :environment do
  MedStatistic::StatisticUpdater.refresh_statistic_data
end

task :update_cache => :environment do
  Autosuggest::CacheUpdater.refresh_autosuggest_data
end
