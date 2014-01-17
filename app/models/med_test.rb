class MedTest
  include Mongoid::Document
  include Mongoid::Timestamps


  field :tracking_number, type: String
  validates_presence_of :tracking_number

  field :test_date, type: Date
  field :doctor_client, type: String
  field :description, type: String
  field :conclusion, type: String
  field :test_purpose, type: String

  attr_accessor :body_ids

  embeds_many :antibodies, before_add: :strip_name

  private

  def strip_name(antibody)
    return false if antibody.name.blank?

    antibody.name.strip! if antibody.name
  end

end
