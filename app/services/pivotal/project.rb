class Project

  attr_reader :id, :stories

  def initialize(id)
    @id = id
    @stories = []
  end

  def generate_tickets_for(features)
    project = PivotalTracker::Project.find(id)

    features.each do |feat|
      story_hash = { name: feat[:name],
                     story_type: "feature",
                     description: feat[:description] }
      @stories << project.stories.create(story_hash)
    end
  end
end

