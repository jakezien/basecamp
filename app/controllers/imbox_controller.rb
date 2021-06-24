class ImboxController < ApplicationController

	def index
		@topics = Topic.all
	end

end
