post '/post_answer' do
	answer = Answer.new(answer: params[:answer_input], question_id: params[:question_id], user_id: session[:id])
	if answer.save
		return {success: true, input: params[:answer_input], user_id: session[:id], user_name: User.find_by(id: session[:id]).fullname}.to_json
	end
end