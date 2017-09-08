require 'byebug'

get '/' do
	@question = Question.all
	@user = User.all
	@answer = Answer.all
  erb :"static/index"
end