module ApplicationHelper
  
  def timestamp_readable(timestamp)
    "#{Date::MONTHNAMES[timestamp.month]} #{timestamp.mday}#{(", " + timestamp.year unless timestamp.year == Date.today.year)}"
  end
  
  def timestamp_readable_with_time(timestamp)
        "#{Date::MONTHNAMES[timestamp.month] + " "+ timestamp.mday.to_s + ", " unless timestamp.to_date == Date.today }#{(timestamp.year.to_s + ", " unless timestamp.year == Date.today.year)} #{timestamp.hour}:#{timestamp.min}"
  end

	def paypal_link_id
		ENV['PAYPAL_LINK_ID'] || "P9YCBHHYD5CKY"
	end
  
end
