require 'spec_helper'

describe "antibodies/index" do
  before(:each) do
    assign(:antibodies, [
      stub_model(Antibody,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Antibody,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of antibodies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
