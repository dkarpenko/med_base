class Antibody
  include Mongoid::Document

  field :name, :type => String
  validates_presence_of :name

  field :description, :type => String
  field :result, :type => String
  field :reaction_mark, :type => String
  field :reaction_score_percentage, :type => Integer
  field :reaction_score_score, :type => Integer

  embedded_in :med_test, :inverse_of => :antibodies
end
