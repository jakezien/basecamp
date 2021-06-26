class SetAsideController < ApplicationController

	def index
		@topics = Topic.all.filter {
			|topic| topic.set_aside?
		}.sort {
			|a, b| b.messages.last[:time_received] <=> a.messages.last[:time_received]
		}.group_by {
			|topic| topic.status
		}
	end

end
