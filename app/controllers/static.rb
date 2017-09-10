require 'byebug'

get '/' do
	@question = Question.all
	@user = User.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
  erb :"static/index"
end