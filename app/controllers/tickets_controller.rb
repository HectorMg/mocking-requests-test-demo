class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def delete
    Ticket.destroy(params[:id])
  end

  def new
  end

  def create
    @tickets_hash = params["features"]
    @tickets = []

    (0..4).each do |index|
      @tickets << {:name => @tickets_hash["#{index}"]["name"],
                   :description => @tickets_hash["#{index}"]["description"]}
    end

    pivotal_service = PivotalService.new(@tickets)
    pivotal_service.raise_tickets
    pivotal_service.save_tickets
  end
end
