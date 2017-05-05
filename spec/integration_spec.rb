require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the homepage display path', {:type => :feature} do
  it 'shows a welcome message' do
    visit '/'
    expect(page).to have_content "Welcome to BetterTheWorld's Volunteer Tracker"
  end
end

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('title', :with => 'Bellview Elementary School Garden Planting')
    click_button('Create Project')
    expect(page).to have_content('Bellview Elementary School Garden Planting')
  end
end

describe 'the volunteer creation path', {:type => :feature} do
  it 'adds a volunteer to a project' do
    test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
    test_project.save
    visit '/'
    select('Bellview Elementary School Garden Planting', :from => 'project_id')
    fill_in('name', :with => 'Sally Jenkins')
    fill_in('hours', :with => 0)
    click_button('Add Volunteer')
    expect(page).to have_content('Sally Jenkins')
  end
end
