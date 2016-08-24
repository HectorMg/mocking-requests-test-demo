require "pivotal-tracker"

class PivotalService
  attr_reader :project

  def initialize()
    @project = Project.new(ENV['PIVOTAL_TEST_PROJECT_ID'])
    PivotalTracker::Client.token = ENV['PIVOTAL_API_KEY'] #api_key
  end

  def raise_tickets
    @project.generate_tickets_for(features)
  end

  def save_tickets
    @project.stories.each do |story|
      ticket_hash = { pivotal_ticket_id: story.id,
                      name: story.name,
                      description: story.description,
                      created_at: story.created_at,
                      status: story.current_state }
      Ticket.create(ticket_hash)
    end
  end

end

