module ApplicationHelper

	def titleize_column_name(col_name)
		col_name.titleize
	end

	def is_admin?
		if user_signed_in?
			current_user.try(:is_admin?)
		else
			false
		end
	end

	def is_owner? (resource)
		if user_signed_in?
			current_user.id == resource.try(:user_id)
		else
			false
		end
	end

	def to_be_approved_books
	    Book.all.each { |b| b if !b.is_approved?}
	end
end
