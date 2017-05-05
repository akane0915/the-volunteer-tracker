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

describe 'the project update path', {:type => :feature} do
  it 'takes the allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
    test_project.save
    visit '/'
    click_link('Bellview Elementary School Garden Planting')
    click_link('Edit Bellview Elementary School Garden Planting Project')
    fill_in('title', :with => 'Walker Elementary School Garden Planting')
    click_button('Update Project')
    expect(page).to have_content('Walker Elementary School Garden Planting')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    click_button('Delete Project')
    expect(page).to have_content("Welcome to BetterTheWorld's Volunteer Tracker")
  end
end

describe 'the volunteer creation and deletion path', {:type => :feature} do
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
  # it 'deletes a volunteer' do
  #   click_link('Sally Jenkins')
  #   click_button('Delete Volunteer')
  #   expect(page).to have_content('Bellview Elementary School Garden Planting')
  # end
end
