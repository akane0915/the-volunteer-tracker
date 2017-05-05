class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(another_project)
    @title == another_project.title
  end

  def Project.all
    projects = []
    db_output = DB.exec('SELECT * from projects ORDER BY title;')
    db_output.each do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    returned_id = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = returned_id.first.fetch('id').to_i
  end

  def Project.find(identification)
    matched_project = nil
    Project.all.each do |project|
      if project.id == identification
        matched_project = project
      end
    end
    matched_project
  end
end
