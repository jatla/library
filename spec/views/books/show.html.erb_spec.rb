require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "Title",
      :author => "Author",
      :isbn => "Isbn",
      :image => "Image",
      :is_active => false,
      :is_approved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Author/)
    rendered.should match(/Isbn/)
    rendered.should match(/Image/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
