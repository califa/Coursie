class ApplicationController < ActionController::Base
  protect_from_forgery

  def to_two(range)

    range.map! do |x|
      format("%02d", x)
    end

  end

end
