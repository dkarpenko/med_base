class MedTest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :test_date, type: Date

  field :tracking_number, type: String
  validates_presence_of :tracking_number

  field :doctor_client, type: String
  field :description, type: String
  field :conclusion, type: String

  attr_accessor :body_ids

  embeds_many :antibodies

  field :test_purpose, type: String
end
