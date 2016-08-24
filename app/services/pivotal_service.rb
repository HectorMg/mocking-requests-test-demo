require "pivotal-tracker"

class PivotalService
  attr_reader :project, :features

  def initialize(features)
    @project = Pivotal::Project.new(1790611)
    @features = features
    PivotalTracker::Client.token = "7fd6dea86de574c50a0ce92b1f342f2d" #api_key

  end

  def raise_tickets
    @project.generate_tickets_for(@features)
  end

  def save_tickets
    @project.stories.each do |story|
      ticket_hash = { pivotal_ticket_id: story.id,
                      name: story.name,
                      description: story.description,
                      created_at: story.created_at}
      Ticket.create(ticket_hash)
    end
  end

end

