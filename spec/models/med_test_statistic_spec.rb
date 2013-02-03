require 'spec_helper'

describe MedTestStatistic do
  subject { described_class.new }
  describe 'Attribute accessors' do
    it { should be_accessible :headers }
    it { should be_accessible :statistic_data }
  end

  describe 'Validation' do
    [:type_key, :headers, :statistic_data].each do |attribute|
      it "nil value should not be valid for #{attribute}" do
        subject.send("#{attribute}=", nil)
        subject.should_not be_valid

      end
    end
  end

  describe 'Initialization' do
    describe 'Default values' do
      it 'returns an empty array of headers right after initialization' do
        subject.headers.should eq([])
      end

      it 'returns an empty array of statistic_data right after initialization' do
        subject.statistic_data.should eq([])
      end
    end
  end
end
