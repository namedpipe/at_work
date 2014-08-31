class Accomplishment < ActiveRecord::Base
	validates_presence_of :accomplishment, :on => :create, :message => "can't be blank"
	belongs_to :user
	attr_accessible :accomplishment, :user

	def self.recent_accomplishments
		where("user_id IS NOT NULL AND created_at > :created_at", {:created_at => 9.days.ago}).order("created_at DESC").all
	end
end
