class CreateUsers < ActiveRecord::Migration[5.0]
	def change
		create_table:users do |t|
			t.string :fullname
			t.string :email
			t.string :password_digest

			t.timestamps
		end 

		create_table:questions do |t|
			t.string :question
			t.integer :user_id

			t.timestamps
		end

		create_table:answers do |t|
			t.string :answer
			t.integer :question_id
			t.integer :user_id

			t.timestamps
		end

		create_table:votes do |t|
			t.integer :user_id
			t.integer :foreign_id
			t.string :type
			t.integer :up_down
		end
	end
end
