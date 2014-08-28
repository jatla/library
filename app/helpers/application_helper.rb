module ApplicationHelper

	def titleize_column_name(col_name)
		col_name.titleize
	end

	def is_admin?
		current_user.try(:is_admin?)
	end

	def is_owner? (resource)
		current_user.try(:id) == resource.try(:user_id)
	end

	def can_be_approved? (resource)
		if !resource.nil? && resource.respond_to?(:image)
			!resource.try(:image).nil? && resource.try(:image).length > 0
		else
			false
		end
	end

	def can_be_reviewed?(book)
		book.is_active? && !current_user.try(:is_blocked?) 
	end

	def tag_helper(book)
		book.tags.collect { |t| t.name }.join(";")
	end

	def short_string_for(str, length)
		truncate(str, length: length, omission: "...")
	end

	def image_required_message
		highlight(':image is required for the book to be approved!', ':image is required for the book to be approved!')
	end


	def is_tag_used?(tag)
		(BookTag.where(tag_id: tag.id)).empty?
	end

	def bootstrap_class_for flash_type
	    case flash_type
	      when :success
	        "alert-success"
	      when :error
	        "alert-error"
	      when :alert
	        "alert-block"
	      when :notice
	        "alert-info"
	      else
	        flash_type.to_s
	    end
  	end
end
