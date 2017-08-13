class Candidate < ApplicationRecord
	has_many :vote_logs
	validates :name, presence: true
end
