post '/post_question' do
	if logged_in?
		question = Question.new(question: params[:question_input], user_id: session[:id])
		if question.save
			return {success: true, input: params[:question_input], user_id: session[:id]}.to_json
		end
	else
		return {success: false, data_url: "/signup_page"}.to_json
	end
end

get '/questions/:id' do
	if params[:id] == "all_questions"
		@question = Question.all
		@answer = Answer.all
		erb :"questions/all_questions"
	else
		@answer = Answer.all
		@question = Question.find(params[:id])
		erb :"questions/question"
	end
end