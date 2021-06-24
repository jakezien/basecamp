class Topic < ApplicationRecord
	has_many :messages
	has_one :sticky
	has_and_belongs_to_many :labels
end
