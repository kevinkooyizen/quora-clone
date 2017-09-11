require 'byebug'

get '/' do
	@question = Question.all
	@user = User.all
	@answer = Answer.all
	@question_vote = QuestionVote.all
	@answer_vote = AnswerVote.all
  erb :"static/index"
end