module RenderCaloriesHelper

  def calories_data
    time_ago = 1.months.ago
    calories_by_day = total_grouped_by_day(time_ago)

    (time_ago.to_date..Date.today).map do |day|
      if calories_by_day[day].nil?
        curr_value = 0
      else
        curr_value = calories_by_day[day].first.try(:total_value) || 0
      end
       {created_at: day, value: curr_value}
    end
  end

    def total_grouped_by_day(time_ago)
        # calories = current_user.calories.where(created_at: time_ago.beginning_of_day..Time.now)
        calories = current_user.calories.where("created_at > ?", time_ago.to_date)
        calories = calories.group("created_at")
        calories = calories.select("created_at, sum(value) as total_value")
        calories.group_by { |c| c.created_at.to_date}
        
    end

end
