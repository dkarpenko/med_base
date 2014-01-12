require 'spec_helper'

describe MedTest do

  describe 'Validation' do
    it { should validate_presence_of(:tracking_number) }
  end

  describe 'Cleaning antibodies' do
    it 'should remove spaces from antibody name after adding it to collection' do
      antibody = Antibody.new
      antibody.name = '   name    '

      med_test = MedTest.new
      med_test.antibodies << antibody

      med_test.antibodies[0].name.should eq('name')
    end

  end

end
