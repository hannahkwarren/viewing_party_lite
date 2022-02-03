module TimeHelper 

  def to_hours_mins(mins)
    hours = (mins / 60).to_i
    mins = (mins % 60).to_i

    "#{hours} hours #{mins} minutes"
  end

end
