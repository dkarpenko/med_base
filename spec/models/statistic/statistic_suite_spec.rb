require 'spec_helper'

describe Statistic::StatisticSuite do

  describe 'Returning results' do
    subject { described_class.new(lambda { |element| [element] },
                                  lambda { |element| [element] },
                                  lambda { |elements| elements.blank? ? 0 : elements.size }) }

    it 'result data should not contain duplicated columns' do
      input_elements = %w(B B a b c)
      input_elements.each {|element| subject.add_element(element)  }

      subject.normalize_data[:headers].should eq(input_elements.sort.uniq.insert(0, ''))
    end

    it 'result rows and columns should be sorted by first element' do

      input_elements = %w(c C a D E d b B h G g)
      input_elements.each {|element| subject.add_element(element)  }

      normalizing_results  = subject.normalize_data

      ordered_input_elements = %w(B C D E G a b c d g h)
      ordered_input_headers = %w(B C D E G a b c d g h).insert(0,'')

      normalizing_results[:headers].should eq(ordered_input_headers)
      normalizing_results[:statistic_data].collect{|row| row[0]}.should eq(ordered_input_elements)

    end
  end


end
