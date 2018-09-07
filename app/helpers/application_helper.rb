module ApplicationHelper
  def tags(ticket)
    ticket.tags.empty? ? '-' : ticket.tags.join(", ")
  end

  def error_status_statement(obj)
    count = obj.errors.size
    item = obj.class.name.downcase

    "#{count} #{count > 1 ? 'errors' : 'error'} prohibited this #{item} from being saved:"
  end
end
