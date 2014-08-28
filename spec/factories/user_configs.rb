FactoryGirl.define do
	factory :user_config, class: UserConfig do
	    rating_threshold 1
	    opt_out_by_rating  true
	    opt_out_by_review true
	    daily_digest_enabled true
	  end
end