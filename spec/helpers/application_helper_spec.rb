require 'spec_helper'

describe ApplicationHelper do
	before do
		@approved_book = create(:approved_active_book)
		@approved_book.save!
		@inactive_book = create(:approved_in_active_book)
		@inactive_book.save!
		@un_approved_book = create(:un_approved_book)
		@un_approved_book.tags = create_list(:tag, 5)
    	@un_approved_book.save!
		@user = create(:user)
		@user.save!
		@admin = create(:admin)
		@admin.save!
	end

	describe "titleize_column_name" do
		it "should titleize the string" do
			expect(helper.titleize_column_name("this")).to eq("This")
		end
	end
	describe "short_string_for" do
		it "should return string of specified length with '...' appended" do
			expect(helper.short_string_for("1234567890qwerty", 10)).to eq("1234567...")
		end
		it "should return input string if its less than required length" do
			expect(helper.short_string_for("this", 10)).to eq("this")
		end
	end
	describe "can_be_approved?" do
		it "should return true is book has image" do
			expect(helper.can_be_approved?(@approved_book)).to eq(true)
		end
		it "should return false is book has no image" do
			expect(helper.can_be_approved?(@un_approved_book)).to eq(false)
		end
		it "should return false is book is nil" do
			expect(helper.can_be_approved?(nil)).to eq(false)
		end
	end
	describe "tag_helper" do
		it "should concat all tags of a book seperated by ';'" do
			expect(helper.tag_helper(@un_approved_book)).to eq(@un_approved_book.tags.collect { |t| t.name }.join(";"))
		end
	end
	describe "can_be_reviewed?" do
		it "should concat all tags of a book seperated by ';'" do
			expect(helper.tag_helper(@un_approved_book)).to eq(@un_approved_book.tags.collect { |t| t.name }.join(";"))
		end
	end
end
