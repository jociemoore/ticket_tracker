module ApplicationHelper
  def tags(ticket)
    ticket.tags.empty? ? '-' : ticket.tags.join(", ")
  end

  def error_status_statement(obj)
    count = obj.errors.size
    item = obj.class.name.downcase

    "#{count} #{count > 1 ? 'errors' : 'error'} prohibited this #{item} from being saved:"
  end

  def how_long_ago(time)
    @difference = Time.now.utc - time
    phrase = ""

    if less_than_60_seconds?
      phrase = "less than a minute ago"
    elsif less_than_1_hour?
      minutes = @difference / 60
      phrase = "#{minutes.to_i} #{singular_minutes? ? 'minute' : 'minutes'} ago"
    elsif less_than_1_day?
      hours = @difference / 3600
      phrase = "about #{hours.to_i} #{singular_hours? ? 'hour' : 'hours'} ago"
    else
      days = @difference / 86400
      phrase = "#{days.to_i} #{singular_days? ? 'day' : 'days'} ago"
    end

    phrase
  end

  private

  def less_than_60_seconds?
    @difference < 60
  end

  def less_than_1_hour?
    @difference < 3600
  end

  def less_than_1_day?
    @difference < 86400
  end

  def singular_minutes?
    @difference < 120
  end

  def singular_hours?
    @difference < 86400 && ((@difference / 3600).to_i == 1)
  end

  def singular_days?
    (@difference / 86400).to_i == 1
  end
end
