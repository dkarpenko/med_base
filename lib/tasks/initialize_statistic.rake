@x_function = Proc.new do |element|
  [element.test_date ? element.test_date.strftime('%Y.%m') : 'n/a']
end

@aggregation_function = Proc.new do |elements|
  elements.blank? ? 0 : elements.size
end

def get_statistic(y_function)
  suite = Statistic::StatisticSuite.new(y_function, @x_function, @aggregation_function)

  MedTest.all.each { |test| suite.add_element(test) }
  suite.normalize_data
end

def test_purpose_statistic
  y_function = Proc.new do |element|
    [element.test_purpose]
  end
  get_statistic(y_function)
end


def antibody_statistic
  y_function = Proc.new do |element|
    element.antibodies.collect {|antibody| antibody.name}.compact.uniq
  end
  get_statistic(y_function)
end

namespace :medbase do

  desc 'Initialize statistic data'
  task :initialize_data => :environment do

    MedTestStatistic.find_or_create_by({type_key: 'antibodies_date'}).update_attributes(antibody_statistic)
    MedTestStatistic.find_or_create_by({type_key: 'antibodies_test_type'}).update_attributes(test_purpose_statistic)
  end


end