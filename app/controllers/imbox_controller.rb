class ImboxController < ApplicationController

	def index
		@topics = Topic.all.sort {|a, b| b.messages.last[:time_received] <=> a.messages.last[:time_received]}
	end

end
