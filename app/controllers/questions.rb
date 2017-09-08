post '/post_question' do
	question = Question.new(question: params[:question_input], user_id: session[:id])
	if question.save
		return {success: true, input: params[:question_input], user_id: session[:id]}.to_json
	end
end

get '/questions/:id' do
	@answer = Answer.all
	@question = Question.find(params[:id])
	erb :"questions/question"
end