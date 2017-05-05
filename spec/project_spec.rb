require "spec_helper"

describe Project do
  describe '#title' do
    it 'returns the title of the project' do
      test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      expect(test_project.title).to eq 'Bellview Elementary School Garden Planting'
    end
  end

  describe '#id' do
    it 'returns the id of the project before saving project' do
      test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      expect(test_project.id).to eq nil
    end
    it 'returns the id of the project after saving project' do
      test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      test_project.save
      expect(test_project.id).to be_an_instance_of Fixnum
    end
  end

  describe '#==' do
    it 'is the same project if two projects have the same title' do
      project1 = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      project2 = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      expect(project1 == project2).to eq true
    end
  end

  describe '.all' do
    it 'is empty to start' do
      expect(Project.all).to eq []
    end

    it 'returns all projects alphabetically' do
      project1 = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      project1.save
      project2 = Project.new({:title => 'Habitat for Humanity Build', :id => nil})
      project2.save
      expect(Project.all).to eq [project1, project2]
    end
  end
end
