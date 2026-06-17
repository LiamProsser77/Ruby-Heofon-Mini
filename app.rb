# app.rb - Heofon Mini Search (Real Ruby Web App)
require 'sinatra'
require 'sinatra/reloader' if development?

set :port, ENV['PORT'] || 4567

get '/' do
  erb :index
end

post '/search' do
  query = params[:query].to_s.strip.downcase

  database = {
    "heofon"  => "Privacy-first search engine founded by Liam Prosser in 2026",
    "ruby"    => "Elegant programming language used to build this website",
    "hpp"     => "Heofon Programming Platform - Python + HTML combined",
    "liam"    => "Norwegian-American developer, coin collector, and founder of Heofon",
    "privacy" => "We don't track searches. Your privacy matters.",
    "search"  => "You are using a real Ruby web application right now"
  }

  results = database.select do |key, description|
    key.include?(query) || description.downcase.include?(query)
  end

  erb :results, locals: { query: query, results: results }
end
