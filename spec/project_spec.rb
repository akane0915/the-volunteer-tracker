require "spec_helper"

describe Project do
  describe '#title' do
    it 'returns the title of the project' do
      test_project = Project.new({:title => 'Bellview Elementary School Garden Planting', :id => nil})
      expect(test_project.title).to eq 'Bellview Elementary School Garden Planting'
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
  end
end
