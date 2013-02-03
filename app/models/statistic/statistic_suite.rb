class Statistic::StatisticSuite

  attr_accessor :data
  attr_accessor :statistic_name


  def initialize(y_position_function, x_position_function, aggregation_function, key= nil)
    @x_positions_for= x_position_function
    @y_positions_for= y_position_function
    @aggregation_function= aggregation_function
    @statistic_name= key


    @statistic_rows = {}

  end

  def add_element(element)
    return [] unless element

    @y_positions_for[element].each do |y_position|
      @statistic_rows[y_position] = Statistic::StatisticRow.new(@x_positions_for, @aggregation_function) if @statistic_rows[y_position].nil?
      @statistic_rows[y_position].add_element(element)
    end

  end


  def normalize_data
    all_keys= @statistic_rows.collect { |row_key, row_data| row_data.row_keys }.flatten.compact.uniq.sort

    statistic_data = @statistic_rows.collect do |row_key, row_data|
      row_data.normalize_row(all_keys).insert(0, row_key)
    end

    {headers: all_keys, statistic_data: statistic_data}
  end




end