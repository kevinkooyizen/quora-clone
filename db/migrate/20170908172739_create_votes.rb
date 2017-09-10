class CreateVotes < ActiveRecord::Migration[5.0]
	def change
		drop_table :votes

		create_table :question_votes do |t|
			t.belongs_to :user
			t.belongs_to :question
			t.boolean :upvote,	default: false
			t.boolean :downvote, default: false
		end

		create_table :answer_votes do |t|
			t.belongs_to :user
			t.belongs_to :question
			t.boolean :upvote, 		default: false
			t.boolean :downvote,		default: false
		end
	end
end
