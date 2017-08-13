class CandidatesController < ApplicationController

	before_action :find_cand, only: [:show, :edit, :update, :destroy, :vote]
	
	def index
		@candidates = Candidate.all.order(id: :desc)
		#render action: "edit" #去找edit.html
	end

	def new
		@candidate = Candidate.new
	end
	def create
		@candidate = Candidate.new(clean_cand_params) 

      if @candidate.save
        redirect_to candidates_path, notice: "new!"
      else
        render :new, notice: "WRONG!"
        #redirect_to new_candidate_path 
        #用redirect_to 不會保留剛剛打好的資料 會惹怒民眾！  (edit同理
      end
	end

	def edit
		#find_cand
	end

	def update
		#find_cand

		if @candidate.update(clean_cand_params)
			redirect_to candidates_path, notice: "update!"
    else
        render :edit, notice: "WRONG!"
    end
	end

	def destroy
		#find_cand
		@candidate.destroy
		redirect_to candidates_path, notice: "destroy!"
	end
	def show
		#find_cand
	end

	def vote

		@candidate.vote_logs.create(ip_address: request.remote_ip) # 包含save!
		#@candidate.vote_logs.new(ip_address: remote_ip)
		# @candidate.save

		#MAIL
		CandidateMailer.notify(@candidates).deliver

		redirect_to candidates_path, notice: "vote!"

		# @candidate.vote += 1
		# @candidate.save
		# redirect_to candidates_path, notice: "vote!"
	end
		
	


	private #######

	def clean_cand_params #params[:candidate]
		clean_params = params.require(:candidate).permit(:name, :age, :gender, :politics)
	end

	def find_cand
		@candidate = Candidate.find_by(id: params[:id])
		redirect_to candidates_path unless @candidate
	end

end
