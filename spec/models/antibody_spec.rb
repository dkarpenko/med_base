require 'spec_helper'

describe Antibody do

  describe "Validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

end
