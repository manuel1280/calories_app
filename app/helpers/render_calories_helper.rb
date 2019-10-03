module RenderCaloriesHelper

  def calories_data
    time_ago = 1.weeks.ago
    calories_by_day = current_user.calories.total_grouped_by_day(time_ago)
    calories_won_by_day = current_user.calories.where(type_value: "won").total_grouped_by_day(time_ago)
    calories_lost_by_day = current_user.calories.where(type_value: "lost").total_grouped_by_day(time_ago)

    (time_ago.to_date..Date.today).map do |day|
      {
      created_at: day,
      value: complete_nil_fields(calories_by_day[day]),
      won: complete_nil_fields(calories_won_by_day[day]),
      lost: complete_nil_fields(calories_lost_by_day[day])
      }
    end
  end

  def complete_nil_fields(calory)
    calory.nil? ? 0 : calory.first.try(:total_value)
  end

end
