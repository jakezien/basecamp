class SetAsideController < ApplicationController

	def index
		@topics = Topic.all
	end

end
