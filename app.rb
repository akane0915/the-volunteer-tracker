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

post '/' do
  title = params.fetch('title')
  new_project = Project.new({:title => title, :id => nil})
  new_project.save
  @projects = Project.all
  erb :index
end

get '/projects/:id' do
  id = params.fetch('id').to_i
  @project = Project.find(id)
  erb :project
end

post '/projects/:id' do
  # @id = params.fetch('id').to_i
  name = params.fetch('name')
  hours = params.fetch('hours').to_i
  project_id = params.fetch('project_id').to_i
  new_volunteer = Volunteer.new({:name => name, :hours => hours, :project_id => project_id})
  new_volunteer.save
  @project = Project.find(project_id)
  erb :project
end
