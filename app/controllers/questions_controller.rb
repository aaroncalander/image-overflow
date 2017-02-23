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

  redirect '/questions'
end
