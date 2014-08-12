module ApplicationHelper

	def titleize_column_name(col_name)
		col_name.titleize
	end



	def to_be_approved_books
	    Book.all.each { |b| b if !b.is_approved?}
	end
end
