class MedTestStatistic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type_key, type: String

  field :headers, type: Array, default: []
  validates_presence_of :headers, allow_nil: false
  field :statistic_data, type: Array, default: []
  validates_presence_of :statistic_data, allow_nil: false

end
