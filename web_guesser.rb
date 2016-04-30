require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  background_color = get_color(guess)
  erb:index, :locals => {:number => SECRET_NUMBER, :message => message,
                         :background_color => background_color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    guess > SECRET_NUMBER + 5 ? "Way too high!" : "Too High!"
  elsif guess < SECRET_NUMBER
    guess < SECRET_NUMBER - 5 ? "Way too low!" : "Too low!"
  else
    "You got it right! The secret number was #{SECRET_NUMBER}."
  end
end

def get_color(guess)
  if guess > SECRET_NUMBER
    guess > SECRET_NUMBER + 5 ? "red" : "indianred"
  elsif guess < SECRET_NUMBER
    guess < SECRET_NUMBER - 5 ? "red" : "indianred"
  else
    "green"
  end
end
