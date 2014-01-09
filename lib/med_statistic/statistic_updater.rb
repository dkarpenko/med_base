module MedStatistic
  class StatisticUpdater


    def self.refresh_statistic_data
      x_function = Proc.new do |element|
        [element.test_date ? element.test_date.strftime('%Y.%m') : 'n/a']
      end

      aggregation_function = Proc.new do |elements|
        elements.blank? ? 0 : elements.size
      end

      MedTestStatistic.find_or_create_by({type_key: 'antibodies_date', key_is_antibody: true}).update_attributes(antibody_statistic(x_function, aggregation_function))
      MedTestStatistic.find_or_create_by({type_key: 'antibodies_test_type', key_is_antibody: false}).update_attributes(test_purpose_statistic(x_function, aggregation_function))

      MedTestStatistic.find_or_create_by({type_key: 'tests_total', key_is_antibody: false}).update_attributes(tests_total(x_function))
    end


    def self.test_purpose_statistic(x_function, aggregation_function)
      y_function = Proc.new do |element|
        [element.test_purpose]
      end
      self.get_statistic(y_function, x_function, aggregation_function)
    end


    def self.antibody_statistic(x_function, aggregation_function)
      y_function = Proc.new do |element|
        element.antibodies.collect { |antibody| antibody.name }.compact.uniq
      end
      self.get_statistic(y_function, x_function, aggregation_function)
    end

    def self.tests_total(x_function)

      aggregation_function = Proc.new do |elements|
        elements.blank? ? 0 : elements.map{|element| element.antibodies.count}.inject(0, :+)
      end

      y_function = Proc.new do |element|
        %w(Total)
      end
      self.get_statistic(y_function, x_function, aggregation_function)
    end


    def self.get_statistic(y_function, x_function, aggregation_function)
      suite = Statistic::StatisticSuite.new(y_function, x_function, aggregation_function)

      MedTest.all.each { |test| suite.add_element(test) }
      suite.normalize_data
    end


  end
end