require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      expect(test_volunteer.name).to eq 'Sally'
    end
  end

  describe '#hours' do
    it 'returns the hours of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      expect(test_volunteer.hours).to eq 10
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      expect(test_volunteer.project_id).to eq 1
    end
  end

  describe '#id' do
    it 'returns the id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => 12})
      expect(test_volunteer.id).to eq 12
    end
  end

  describe '#==' do
    it 'is the same volunteer if two volunteers have the same name' do
      volunteer1 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => 12})
      volunteer2 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => 12})
      expect(volunteer1 == volunteer2).to eq true
    end
  end

  describe '.all' do
    it 'is empty to start' do
      expect(Volunteer.all).to eq []
    end

    it 'returns all volunteers alphabetically' do
      volunteer1 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :hours => 15, :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.all).to eq [volunteer2, volunteer1]
    end
  end

  describe '#save' do
    it 'adds a volunteer to the volunteers table' do
      volunteer1 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      volunteer1.save
      expect(Volunteer.all).to eq [volunteer1]
    end
  end

  describe '.find' do
    it 'returns a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :hours => 15, :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to eq volunteer1
    end
  end

  describe '#update' do
    it 'allows a user to update name of a volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally Randall', :hours => 10, :project_id => 1, :id => nil})
      test_volunteer.save
      test_volunteer.update({:name => 'Sally Jenkins', :hours => 10, :project_id => 1, :id => nil})
      expect(test_volunteer.name).to eq 'Sally Jenkins'
    end
    it 'allows a user to update hours of a volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally Randall', :hours => 10, :project_id => 1, :id => nil})
      test_volunteer.save
      test_volunteer.update({:name => 'Sally Jenkins', :hours => 20, :project_id => 1, :id => nil})
      expect(test_volunteer.hours).to eq 20
    end
  end

  describe '#delete' do
    it 'allows a user to delete a volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally Randall', :hours => 10, :project_id => 1, :id => nil})
      test_volunteer.save
      test_volunteer.delete
      expect(Volunteer.all).to eq []
    end
  end
end
