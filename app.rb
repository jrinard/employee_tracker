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

#takes you to form to add division
get("/divisions/new") do
  erb(:division_form)
end

#view list of divisions
get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

#allows you to view specific division by id
get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

#creates a division
post("/divisions") do
  name = params.fetch("name")
  division = Division.create({:name => name, :id => nil})
  redirect "/divisions"
end

#takes you to edit page for divisions for UPDATING
get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end
#update name of division
patch('/divisions/:id') do
  name = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  erb(:index)
end
#adds employee to division
post("/employees") do
  name = params.fetch("name")
  division_id = params.fetch("division_id").to_i
  @division = Division.find(division_id)
  @employee = Employee.create({:name => name, :division_id => division_id })
  redirect "/divisions"
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i)
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i)
  @employee.update({:name => name})
  @employee = Employee.all()
  redirect "/divisions"

  #Because you are returning to divisions it needs redefined below. Or use redirect as above
  # @divisions = Division.all()
  # erb(:divisions)
end
