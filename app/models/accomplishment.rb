class Accomplishment < ActiveRecord::Base
	validates_presence_of :accomplishment, :on => :create, :message => "can't be blank"
	belongs_to :user
end
