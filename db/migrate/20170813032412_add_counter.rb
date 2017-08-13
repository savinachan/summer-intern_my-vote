class AddCounter < ActiveRecord::Migration[5.1]
  def change
  	add_column :candidates, :vote_logs_count, :integer, dafault: 0

  	#Candidate.all.each do |candidate|
	#Candidate.reset_counters(candidate.id, :vote_logs)
	#end
	#把舊資料一併更新
  end
end
