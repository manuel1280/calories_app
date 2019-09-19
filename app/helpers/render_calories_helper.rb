module RenderCaloriesHelper

        # calories_lost = user.where( type_value: 'lost').collect { |v| [m.value] [v.create_at] }
        # calories_won = user.where( type_value: 'won').collect { |m| [m.value] }
    #     calories = [
    #         {created_at: '1',won: 500, lost: 600},
    #         {created_at: '2',won: 330, lost: 330},
    #         {created_at: '3',won: 950, lost: 250},
    #         {created_at: '4',won: 280, lost: 560},
    #         {created_at: '5',won: 879, lost: 720}
    # ]
    def calories_data
        user = current_user.id
        time_ago = 2.weeks.ago
        calories = Calory.where(user_id: user)
        calories_by_day = total_grouped_by_day(time_ago, calories)
        
        (time_ago.to_date..Date.today).map do |date|
          curr_value = calories_by_day[date].first.try(:total_value) || 0
          {created_at: date, value: curr_value}
        end

    end
   
    def total_grouped_by_day(time_ago, curr_calories)
        calories = curr_calories.where(created_at: time_ago.beginning_of_day..Time.now)
        # calories = curr_calories.where("created_at > #{time_ago.to_date}")
        calories = calories.group("date(created_at)")
        calories = calories.select("created_at, sum(value) as total_value")
        calories.group_by { |c| c.created_at.to_date}
    end
    
end
