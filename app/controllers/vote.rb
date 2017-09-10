post '/up_vote' do
	@question = Question.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
	# byebug
	question_vote = QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id], upvote:true)
	if QuestionVote.find_by(user_id: session[:id], question_id: params[:question_id], upvote:true).nil?
		question_vote = QuestionVote.new(user_id: session[:id], question_id: params[:question_id], upvote:true)
		question_vote.save
		redirect "/"
		erb :"/questions/all_questions"
	end
end