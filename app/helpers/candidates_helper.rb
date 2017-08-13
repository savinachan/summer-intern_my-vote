module CandidatesHelper

	def gender_p(value)
		if value == 1
			"M"
		elsif value == 2
			"F"
		else
			"unknown"
		end
	end
end
