require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Sally', :hours => 10, :project_id => 1})
      expect(test_volunteer.name).to eq 'Sally'
    end
  end
end
