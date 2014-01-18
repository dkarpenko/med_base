module Autosuggest

  class CacheUpdater
    def self.refresh_autosuggest_data
      latest_med_tests = MedTest.limit(1000).sort(created_at: -1)

      doctors_names = latest_med_tests.collect { |t| t.doctor_client }.uniq.compact.sort
      test_purposes = latest_med_tests.collect { |t| t.test_purpose }.uniq.compact.sort
      antibody_names = latest_med_tests.collect { |t| t.antibodies }.flatten().collect { |a| a.name }.uniq.compact.sort


      med_test_cache = MedTestCache.first_or_initialize
      med_test_cache.antibody_names = antibody_names
      med_test_cache.test_purposes = test_purposes
      med_test_cache.doctors_names = doctors_names
      med_test_cache.save

    end
  end
end