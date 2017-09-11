class EditingAnswerVotesColumn < ActiveRecord::Migration[5.0]
	def change
		remove_column :answer_votes, :question_id
		add_reference :answer_votes, :question
	end
end
