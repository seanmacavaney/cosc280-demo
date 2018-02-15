require 'mysql2'
require 'sinatra'
require 'erubis'
set :erb, :escape_html => true

HOST = 'localhost'
USER = 'user280'
PASS = 'p4ssw0rd'
DB = 'project280'

get '/' do
  conn = Mysql2::Client.new(:host => HOST, :username => USER, :password => PASS, :database => DB)
  people = conn.query("SELECT first_name, last_name FROM People ORDER BY time_added")
  interests = conn.query("SELECT id, name FROM Interests ORDER BY sort_order")

  # looks for template file views/people.erb
  erb :index, :locals => {:people => people, :interests => interests}
end

post '/insert' do
  #GET in params[:name]
  # params[:first_name] is equivalent to $_GET['first_name]

  conn = Mysql2::Client.new(:host => HOST, :username => USER, :password => PASS, :database => DB)
  statement = conn.prepare("INSERT INTO People (first_name, last_name, phone, age, time_added) VALUES (?, ?, ?, ?, NOW())")
  result = statement.execute(params[:firstname], params[:lastname], params[:phone], params[:age])
  print(result)

  redirect '/'
end
