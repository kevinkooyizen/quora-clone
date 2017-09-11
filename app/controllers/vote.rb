post '/up_vote_question' do
	if !logged_in?
		return {success: false, data_url: "/signup_page"}.to_json
	end
	@question = Question.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
	question_vote = QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id], upvote:true)
	# finding if vote exists
	if QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id]).nil?
		# if upvote doesn't exist then make new vote
		question_vote = QuestionVote.new(user_id: session[:id], question_id: params[:question_id], upvote: true, downvote: false)
		question_vote.save
		vote_count = @question_vote.where(question_id: params[:question_id], upvote: true).count - @question_vote.where(question_id: params[:question_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "up_vote_question"}.to_json
		# redirect "/questions/all_questions"
	# downvote
	else #AnswerVote.find_by(user_id: session[:id], question_id: params[:question_id], downvote:true).nil?
		question_vote = QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id])
		if question_vote.upvote == true
			question_vote.update(upvote: false)
		else
			question_vote.update(upvote: true, downvote: false)
		end
		vote_count = @question_vote.where(question_id: params[:question_id], upvote: true).count - @question_vote.where(question_id: params[:question_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "up_vote_question"}.to_json
	end
end

post '/down_vote_question' do
	if !logged_in?
		return {success: false, data_url: "/signup_page"}.to_json
	end
	@question = Question.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
	# byebug
	question_vote = QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id], downvote:true)
	# finding if vote exists
	if QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id]).nil?
		# if upvote doesn't exist then make new vote
		question_vote = QuestionVote.new(user_id: session[:id], question_id: params[:question_id], upvote: false, downvote: true)
		question_vote.save
		vote_count = @question_vote.where(question_id: params[:question_id], upvote: true).count - @question_vote.where(question_id: params[:question_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "down_vote_question"}.to_json
		# redirect "/questions/all_questions"
	# downvote
	else #AnswerVote.find_by(user_id: session[:id], question_id: params[:question_id], downvote:true).nil?
		question_vote = QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id])
		if question_vote.downvote == true
			question_vote.update(downvote: false)
		else
			question_vote.update(upvote: false, downvote: true)
		end			
		vote_count = @question_vote.where(question_id: params[:question_id], upvote: true).count - @question_vote.where(question_id: params[:question_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "down_vote_question"}.to_json
		# redirect "/questions/all_questions"
	end
end

post '/up_vote_answer' do
	if !logged_in?
		return {success: false, data_url: "/signup_page"}.to_json
	end
	@question = Question.all
	@answer = Answer.all
	@answer_vote = AnswerVote.all
	# byebug
	answer_vote = AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id], upvote:true)
	# finding if vote exists
	if AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id]).nil?
		# if upvote doesn't exist then make new vote
		answer_vote = AnswerVote.new(user_id: session[:id], answer_id: params[:answer_id], upvote: true, downvote: false)
		answer_vote.save
		vote_count = @answer_vote.where(answer_id: params[:answer_id], upvote: true).count - @answer_vote.where(answer_id: params[:answer_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "up_vote_answer"}.to_json
		# redirect "/questions/all_questions"
	# downvote
	else #AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id], downvote:true).nil?
		answer_vote = AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id])
		if answer_vote.upvote == true
			answer_vote.update(upvote: false)
		elsif answer_vote.upvote == false
			answer_vote.update(upvote: true, downvote: false)
		end			
		vote_count = @answer_vote.where(answer_id: params[:answer_id], upvote: true).count - @answer_vote.where(answer_id: params[:answer_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "up_vote_answer"}.to_json
		# redirect "/questions/all_questions"
	end
end

post '/down_vote_answer' do
	if !logged_in?
		return {success: false, data_url: "/signup_page"}.to_json
	end
	@question = Question.all
	@answer = Answer.all
	@answer_vote = AnswerVote.all
	answer_vote = AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id], downvote:true)
	# finding if vote exists
	if AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id]).nil?
		# if upvote doesn't exist then make new vote
		answer_vote = AnswerVote.new(user_id: session[:id], answer_id: params[:answer_id], upvote: false, downvote: true)
		answer_vote.save
		vote_count = @answer_vote.where(answer_id: params[:answer_id], upvote: true).count - @answer_vote.where(answer_id: params[:answer_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "down_vote_answer"}.to_json
		# redirect "/questions/all_questions"
	# downvote
	else #AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id], downvote:true).nil?
		answer_vote = AnswerVote.find_by(user_id: session[:id], answer_id: params[:answer_id])
		if answer_vote.downvote == true
			answer_vote.update(downvote: false)
		else
			answer_vote.update(upvote: false, downvote: true)
		end			
		vote_count = @answer_vote.where(answer_id: params[:answer_id], upvote: true).count - @answer_vote.where(answer_id: params[:answer_id], downvote: true).count
		return {success: true, vote_count: vote_count, input: "down_vote_answer"}.to_json
		# redirect "/questions/all_questions"
	end
end