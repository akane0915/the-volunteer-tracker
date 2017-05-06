require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
also_reload('lib/**/*.rb')
require 'pry'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get '/' do
  @projects = Project.all
  erb :index
end

post '/projects' do
  title = params.fetch('title')
  new_project = Project.new({:title => title, :id => nil})
  new_project.save
  @projects = Project.all
  erb :index
end

get '/projects/:id' do
  @id = params.fetch('id').to_i
  @project = Project.find(@id)
  erb :project
end

post '/volunteers' do
  name = params.fetch('name')
  hours = params.fetch('hours').to_i
  project_id = params.fetch('project_id').to_i
  new_volunteer = Volunteer.new({:name => name, :hours => hours, :project_id => project_id, :id => nil})
  new_volunteer.save
  @project = Project.find(project_id)
  erb :project
end

get '/projects/:id/edit' do
  id = params.fetch('id').to_i
  @project = Project.find(id)
  erb :project_edit
end

patch '/projects/:id' do
  title = params.fetch('title')
  id = params.fetch('id').to_i
  @project = Project.find(id)
  @project.update({:title => title})
  erb :project
end

delete'/projects/:id' do
  id = params.fetch('id').to_i
  @project = Project.find(id)
  @project.delete
  @projects = Project.all
  erb :index
end

get '/volunteers/:id/edit' do
  id = params.fetch('id').to_i
  @volunteer = Volunteer.find(id)
  erb :volunteer_edit
end

patch '/volunteers/:id' do
  name = params.fetch('name')
  hours = params.fetch('hours').to_i
  id = params.fetch('id').to_i
  @volunteer = Volunteer.find(id)
  @volunteer.update({:name => name, :hours => hours})
  project_id = @volunteer.project_id
  @project = Project.find(project_id)
  erb :project
end

delete '/volunteers/:id' do
  id = params.fetch('id').to_i
  @volunteer = Volunteer.find(id)
  project_id = @volunteer.project_id
  @project = Project.find(project_id)
  @volunteer.delete
  erb :project
end
