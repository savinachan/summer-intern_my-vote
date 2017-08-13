class CandidateMailer < ApplicationMailer

	def notify(candidate)
		@candidate = candidate
		mail to: "iamyuyu0210@gmail.com", subject: "TRY!"
	end 

end
