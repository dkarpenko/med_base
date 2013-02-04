class Statistic::StatisticRow

  def initialize(position_function, aggregation_function)
    @positions_for = position_function
    @aggregation_function = aggregation_function
    @elements= {}
  end

  def add_element(element)
    return [] unless element

    @positions_for[element].each do |position|
      @elements[position] = Set.new if @elements[position].nil?
      @elements[position] << element
    end

  end

  def row_keys
    @elements.keys
  end

  def normalize_row(all_positions)
    all_positions.collect do |position|
      @aggregation_function[@elements[position]]
    end
  end





end