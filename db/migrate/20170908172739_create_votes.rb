class CreateVotes < ActiveRecord::Migration[5.0]
	def change
		drop_table :votes

		create_table :question_votes do |t|
			t.boolean :upvote,	default: false
			t.boolean :downvote, default: false
		end

		create_table :answer_votes do |t|
			t.boolean :upvote, 		default: false
			t.boolean :downvote,		default: false
		end
	end
end
