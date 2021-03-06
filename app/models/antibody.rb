class Antibody
  include Mongoid::Document

  field :name, :type => String
  validates_presence_of :name

  embedded_in :med_test, :inverse_of => :antibodies
end
