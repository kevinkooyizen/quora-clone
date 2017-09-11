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
		@question = Question.all
		@answer = Answer.all
		@question_vote = QuestionVote.all
		@answer_vote = AnswerVote.all	
		erb :"users/profile"
	else
		redirect "/"
	end
end

get '/users/:id/questions' do
	@question = Question.all
	@answer = Answer.all
	@user = User.find(params[:id])
	@question_vote = QuestionVote.all
	@answer_vote = AnswerVote.all	
	erb :"users/questions"
end

get '/users/:id/answers' do
	@question = Question.all
	@answer = Answer.all
	@user = User.find(params[:id])
	@question_vote = QuestionVote.all
	@answer_vote = AnswerVote.all
	erb :"users/answers"
end

get '/users/:id' do
	@user = User.find(params[:id])
	@question = Question.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
	@answer_vote = AnswerVote.all
	erb :"users/profile"
end