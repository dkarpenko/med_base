require 'spec_helper'

describe MedTest do

  describe "Validation" do
    it { should validate_presence_of(:tracking_number) }
  end

end
