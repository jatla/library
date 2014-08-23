class OptedOut < ActiveRecord::Base
	belongs_to :book
    belongs_to :user
	validates :user_id, uniqueness: { scope: :book_id,
    	message: "User should be allowed to opt_out the book only once!" }
end