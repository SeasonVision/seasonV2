class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def greeting
    hour = Time.now.hour
    case hour
    when 5..11 then "Morning"
    when 12..17 then "Afternoon"
    else "Evening"
    end
  end
  helper_method :greeting
end
