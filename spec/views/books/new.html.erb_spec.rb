require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :author => "MyString",
      :isbn => "MyString",
      :image => "MyString",
      :is_active => false,
      :is_approved => false
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_author[name=?]", "book[author]"
      assert_select "input#book_isbn[name=?]", "book[isbn]"
      assert_select "input#book_image[name=?]", "book[image]"
      assert_select "input#book_is_active[name=?]", "book[is_active]"
      assert_select "input#book_is_approved[name=?]", "book[is_approved]"
    end
  end
end
