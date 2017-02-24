get '/questions' do
  @questions = Question.all

  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.user = current_user
  @questions = current_user.questions
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    redirect '/questions'
  end
end

get '/questions/:id/answers' do
  @question = Question.find_by(params[:question])
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question = @question
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    "Hello World"
  end
end
