require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      expect(test_volunteer.name).to eq 'Sally'
    end
  end

  describe '#hours' do
    it 'returns the hours of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      expect(test_volunteer.hours).to eq 10
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      expect(test_volunteer.project_id).to eq 1
    end
  end

  describe '#==' do
    it 'is the same volunteer if two volunteers have the same name' do
      volunteer1 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      volunteer2 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      expect(volunteer1 == volunteer2).to eq true
    end
  end
end
