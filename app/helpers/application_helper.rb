module ApplicationHelper
  def get_tags(ticket)
    ticket.tags.join(", ")
  end

  def get_error_status_statement(obj)
    count = obj.errors.size
    item = obj.class.name.downcase

    "#{count} #{count > 1 ? 'errors' : 'error'} prohibited this #{item} from being saved:"
  end
end
