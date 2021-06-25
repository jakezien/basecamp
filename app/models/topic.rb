class Topic < ApplicationRecord
	has_many :messages
	has_one :sticky
	has_and_belongs_to_many :labels

	VALID_STATUSES = ['unseen', 'seen', 'reply_later', 'set_aside', 'feed', 'paper_trail']

	validates :status, inclusion: {in: VALID_STATUSES}

	def unseen?
		status == 'unseen'
	end


	def set_aside?
		status == 'set_aside'
	end


end
