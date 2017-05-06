class Volunteer
  attr_reader(:name, :hours, :project_id, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @hours = attributes.fetch(:hours)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(another_volunteer)
    @name == another_volunteer.name
  end

  def Volunteer.all
    volunteers = []
    db_output = DB.exec('SELECT * from volunteers ORDER BY name;')
    db_output.each do |volunteer|
      name = volunteer.fetch('name')
      hours = volunteer.fetch('hours').to_i
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      volunteers.push(Volunteer.new({:name => name, :hours => hours, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    returned_id = DB.exec ("INSERT INTO volunteers (name, hours, project_id) VALUES ('#{@name}', #{@hours}, #{@project_id}) RETURNING id;")
    @id = returned_id.first.fetch('id').to_i
  end

  def Volunteer.find(identification)
    matched_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.id == identification
        matched_volunteer = volunteer
      end
    end
    matched_volunteer
  end

  def update(volunteer_details)
    @name = volunteer_details.fetch(:name)
    @hours = volunteer_details.fetch(:hours)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{self.id};")
    DB.exec("UPDATE volunteers SET hours = #{@hours} WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end
end
