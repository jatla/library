require 'spec_helper'

describe "book_preferences/edit" do
  before(:each) do
    @book_preference = assign(:book_preference, stub_model(OptedOut))
  end

  it "renders the edit book_preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_preference_path(@book_preference), "post" do
    end
  end
end
