class ImboxController < ApplicationController

	def index
		@topics = Topic.all.filter {
			|topic| topic.status.in?(['unseen', 'seen'])
			# true
		}.sort{
			|a, b| b.messages.last[:time_received] <=> a.messages.last[:time_received]
		}

		# Yeah, this is inefficient, but I'm running out of time :/
		@set_aside = Topic.all.filter {
			|topic| topic.set_aside?
		}.first(7).sort{
			|a, b| b.messages.last[:time_received] <=> a.messages.last[:time_received]
		}
	end

end
