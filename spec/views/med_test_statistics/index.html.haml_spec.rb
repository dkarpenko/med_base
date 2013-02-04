require 'spec_helper'

describe 'med_test_statistics/index' do
  before(:each) do
    assign(:statistics, [
        FactoryGirl.build(:med_test_statistic), FactoryGirl.build(:med_test_statistic)
    ])
  end

  it 'renders a list of statistics' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
