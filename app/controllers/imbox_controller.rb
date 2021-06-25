class ImboxController < ApplicationController

	def index
		@topics = Topic.all.filter {
			|topic| topic.status.in?(['unseen', 'seen'])
			# true
		}.sort{
			|a, b| b.messages.last[:time_received] <=> a.messages.last[:time_received]
		}
	end

end
