FactoryGirl.define do
	factory :approved_active_book, class: Book do
	    title "Approved Active Book"
	    author  "Factory Girl"
	    isbn "FG01"
	    image "approved_active_book"
	    is_active  true
	    is_approved true
	    avg_rating  2
	    user_id 2
	  end

	factory :approved_in_active_book, class: Book do
	    title "Approved But not Active Book"
	    author  "Factory Girl"
	    isbn "FG02"
	    image "approved_in_active_book"
	    is_active  false
	    is_approved true
	    avg_rating  0
	    user_id 2
	  end
end