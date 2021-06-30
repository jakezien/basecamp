class Topic < ApplicationRecord
	has_many :messages, :dependent => :destroy
	has_one :sticky, :dependent => :destroy
	has_and_belongs_to_many :labels

	accepts_nested_attributes_for :sticky, allow_destroy: true, reject_if: :all_blank
	accepts_nested_attributes_for :labels, allow_destroy: true, reject_if: :all_blank

	VALID_STATUSES = [ 'unseen', 'seen', 'feed', 'paper_trail' 'reply_later', 'set_aside', 'set_aside--now', 'set_aside--soon', 'set_aside--later', 'set_aside--whenever', 'set_aside--todo', 'set_aside--reference', 'set_aside--event', 'set_aside--media', 'set_aside--procrastinate']

	validates :status, inclusion: {in: VALID_STATUSES}

	def unseen?
		status == 'unseen'
	end

	def set_aside?
		status.include? 'set_aside'
	end


end
