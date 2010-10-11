# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def time_frame_in_words(date)
		if date.to_date > 1.day.ago.to_date
			"Today"
		elsif date.to_date > 2.day.ago.to_date
			"Yesterday"
		elsif date > 7.day.ago
			date.strftime("%A")
		elsif date.strftime("%Y") != Time.now.strftime("%Y")
			date.strftime("%b %d, %Y")
		else
			date.strftime("%b %d")
		end
	end
end
