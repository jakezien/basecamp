class Topic < ApplicationRecord
	has_many :messages
	has_one :sticky
	has_and_belongs_to_many :labels

	VALID_STATUSES = [ 'unseen', 'seen', 'feed', 'paper_trail' 'reply_later', 'set_aside', 'set_aside_now', 'set_aside_soon', 'set_aside_later', 'set_aside_whenever', 'set_aside_todo', 'set_aside_reference', 'set_aside_event', 'set_aside_media', 'set_aside_procrastinate']

	validates :status, inclusion: {in: VALID_STATUSES}

	def unseen?
		status == 'unseen'
	end


	def set_aside?
		status.include? 'set_aside'
	end


end
