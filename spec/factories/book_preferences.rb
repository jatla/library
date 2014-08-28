FactoryGirl.define do
	factory :book_preferences, class: OptedOut do
	    by_rating true
	    rating_threshold  1
	    by_review true
	  end
end