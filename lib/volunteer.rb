class Volunteer
  attr_reader(:name, :hours, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @hours = attributes.fetch(:hours)
    @project_id = attributes.fetch(:project_id)
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
      volunteers.push(Volunteer.new({:name => name, :hours => hours, :project_id => project_id}))
    end
    volunteers
  end

  def save
    DB.exec ("INSERT INTO volunteers (name, hours, project_id) VALUES ('#{@name}', #{@hours}, #{@project_id});")
  end

  def Volunteer.find(name)
    matched_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.name == name
        matched_volunteer = volunteer
      end
    end
    matched_volunteer
  end

  def update(volunteer_details)
    @name = volunteer_details.fetch(:name)
    @hours = volunteer_details.fetch(:hours)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE name = '#{self.name}' ;")
    DB.exec("UPDATE volunteers SET hours = #{@hours} WHERE name = '#{self.name}' ;")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE name = '#{self.name}';")
  end
end
