class Volunteer
  attr_reader(:name, :hours, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @hours = attributes.fetch(:hours)
    @project_id = attributes.fetch(:project_id)
  end
end
