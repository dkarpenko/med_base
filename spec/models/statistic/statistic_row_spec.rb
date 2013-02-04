require 'spec_helper'

describe Statistic::StatisticRow do

  describe 'Initialization' do
    subject { described_class.new(lambda {}, lambda {}) }

    it 'should return empty set of elements after initialization' do
      subject.row_keys.should_not be_nil
      subject.row_keys.empty?.should be_true
    end
  end


  describe 'Adding elements' do

    subject { described_class.new(lambda { |item| [item * 2, item] }, lambda {}) }

    it 'should calculate and return x_position while adding item' do
      subject.add_element('foo').should eq(['foofoo', 'foo'])
    end

    it 'should change keys section after adding new elements' do
      expect {
        #puts "subject.row_keys: " +subject.row_keys.length.to_s
        subject.add_element('foo')
        #puts "subject.row_keys: " +subject.row_keys.inspect
        #puts "subject.row_keys: " +subject.row_keys.length.to_s
      }.to change(subject, :row_keys)
    end

    it 'should not calculate x_position for nil elements' do
      subject.add_element(nil).should eq([])
    end

    it 'should not add nil items to data set' do
      lambda {
        subject.add_element(nil)
      }.should_not change(subject, :row_keys)
    end

  end

  describe 'Returning results' do
    subject { described_class.new(lambda { |item| [item * 2, item] }, lambda {}) }

    it 'should return hash of all passed elements depending on position function' do
      keys = subject.add_element('foo')

      keys.each do |key|
        subject.row_keys.should_not be_empty
        subject.row_keys.should  include(key)
      end

    end


    it 'all elements values should not contain duplicates and should be instance of ' do
      subject.add_element('foo')

      subject.row_keys.should be_a_kind_of(Enumerable)
      subject.row_keys.should have(2).items
      expect { subject.add_element('foo') }.not_to change(subject, :row_keys)
    end
  end



  describe 'Calculating statistics' do
    subject { described_class.new(lambda { |item| item < 5 ? ['a','b'] : ['b','c']  }, lambda {|elements| elements.length}) }

    it 'should use passed function for calculating statistics' do

      (2..6).each do |element|
        subject.add_element element
      end

      subject.row_keys.should have(3).items
      subject.row_keys.should include('a', 'b', 'c')

      subject.normalize_row(subject.row_keys).should eq([3, 5, 2])

    end
  end


end
