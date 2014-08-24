FactoryGirl.define do
	factory :approved_active_book, class: Book do
	    title "Approved Active Book"
	    author  "Factory Girl"
	    isbn "FG01"
	    image File.open(File.join(Rails.root, '/app/assets/images/default.jpg'))
	    is_active  true
	    is_approved true
	    avg_rating  2
	  end

	factory :approved_in_active_book, class: Book do
	    title "Approved But not Active Book"
	    author  "Factory Girl"
	    isbn "FG02"
	    image File.open(File.join(Rails.root, '/app/assets/images/default.jpg'))
	    is_active  false
	    is_approved true
	    avg_rating  0
	  end

	factory :un_approved_book, class: Book do
	    title "Un Approved book"
	    author  "Factory Girl"
	    isbn "FG03"
	    is_active  false
	    is_approved false
	    avg_rating  0
	  end
end