require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  get '/quiz' do 
    return erb :quiz
  end
  get '/about' do
    return erb :about
  end
  post '/results' do
    answers = params.values 
    @total = 0 
    answers.each do |answer|
      @total += answer.to_i 
    end
    puts @total 
    
    @combo = baking_generator(@total)
    if @combo == "tenMinAlright"
      erb :tenMinAlright
    elsif @combo == "tenMinChallenge"
      erb :tenMinChallenge
    elsif @combo == "thirtyMinAlright"
      erb :thirtyMinAlright
    elsif @combo == "thirtyMinChallenge"
      erb :thirtyMinChallenge
    elsif @combo == "hourAlright"
      erb :hourAlright
    elsif @combo == "hourChallenge"
      erb :hourChallenge
    end 
  end
end 