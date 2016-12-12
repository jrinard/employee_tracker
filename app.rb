require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require("pg")

get("/") do
  erb(:index)
end

get("/divisions/new") do
  erb(:division_form)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

post("/divisions") do
  name = params.fetch("name")
  division = Division.create({:name => name, :id => nil})
   redirect "/divisions"
end
