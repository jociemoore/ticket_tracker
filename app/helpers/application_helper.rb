module ApplicationHelper
  def get_tags(ticket)
    ticket.tags.join(", ")
  end
end
