class MedTestCache
  include Mongoid::Document
  include Mongoid::Timestamps

  field :doctors_names, type: Array
  field :test_purposes, type: Array
  field :antibody_names, type: Array

end