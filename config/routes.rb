Rails.application.routes.draw do
	#get "/candidates", to: "candidates#index"
	#get "/candidates/new", to: "candidates#new"

	#resourses :users, only: [:index] #(只要index一條路徑就好)

	resources :candidates do
		#collection do #(擴充功能)
			##candidates/list => 
			#get :list, to: "candidates#list"
			##candidates/all
		#end

		#member
			##candidates/2/vote
			##candidate/2/cancel
		member do
			post :vote, to: "candidates#vote"
		end

	end

	#post "/candidates/:id/vote", to: "candidates#vote"

	# resources :users do
	# 	resources :posts, only: [:index, :create, :new]
	# end
	# resources :post , only: [:show, :edit, :update, :destroy]	
	# ====>
	# resources :users do
	# 	resources :posts, shallow:true
	# end




end
