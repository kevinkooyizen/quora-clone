require 'byebug'

get '/' do
	@question = Question.all
	@answer = Answer.all
  erb :"static/index"
end

get '/signup_page' do
	erb :"users/signup_page"
end

post '/signup' do
	user = User.new(params[:user])
	# byebug
	if user.save
		session[:id] = user.id
		redirect "/user_profile/#{user.id}"
	else
		# render 'static/signup'
		@errorshown = user.errors.messages
		@errorshown = "#{@errorshown.first[0].to_s.capitalize} #{@errorshown.first[1][0].to_s}"
		erb :"users/signup_page"
		# return {success: false, msg: error}.to_json
	end
end

get '/login_page' do
	erb :"users/login_page"
end

get '/login' do
	user = User.find_by(email: params[:user][:email])
	if user.nil?
		@errorshown = "Wrong email"
		erb :"users/login_page"
	else
		if !user.authenticate(params[:user][:password])
			@errorshown = "Wrong password"
			erb :"users/login_page"
		else
			session[:id] = user.id
			redirect "/user_profile/#{user.id}"
		end
	end
end

get '/logout' do
	session[:id] = nil
	redirect "/"
end

get '/user_profile/:id' do
	if logged_in?
		id = params[:id]
		@user = User.find(id)
		erb :"users/profile"
	else
		redirect "/"
	end
end

post '/post_question' do
	question = Question.new(question: params[:question_input], user_id: session[:id])
	if question.save
		return {success: true, input: params[:question_input], user_id: session[:id]}.to_json
	end
end

post '/post_answer' do
	answer = Answer.new(answer: params[:answer_input], question_id: params[:question_id])
	if answer.save
		return {success: true, input: params[:answer_input], user_id: session[:id]}.to_json
	end
end