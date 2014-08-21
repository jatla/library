module BooksHelper
	def is_followed?(book_id)
		users = Follow.where(book_id: book_id).pluck(:user_id)
		users.include?(current_user.id)
	end
end
