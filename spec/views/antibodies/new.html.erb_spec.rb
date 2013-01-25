require 'spec_helper'

describe "antibodies/new" do
  before(:each) do
    assign(:antibody, stub_model(Antibody,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new antibody form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => antibodies_path, :method => "post" do
      assert_select "input#antibody_name", :name => "antibody[name]"
      assert_select "textarea#antibody_description", :name => "antibody[description]"
    end
  end
end
