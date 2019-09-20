module RenderCaloriesHelper

  def calories_data

    def complete_nil_fields(fields)
      to_fill = calories.count - fields.count
      to_fill.times { fields += [""]}
      return fields
    end

    time_ago = 1.months.ago.to_date
    user = current_user.id
    calories=ActiveRecord::Base.connection.execute("SELECT created_at, SUM(value) FROM calories WHERE user_id = #{user} and created_at > '#{time_ago}' GROUP BY created_at;")
    calories_won=ActiveRecord::Base.connection.execute("SELECT created_at, SUM(value) FROM calories WHERE user_id = #{user} and created_at > '#{time_ago}' and type_value = 'won' GROUP BY created_at;")
    calories_lost=ActiveRecord::Base.connection.execute("SELECT created_at, SUM(value) FROM calories WHERE user_id = #{user} and created_at > '#{time_ago}' and type_value = 'lost' GROUP BY created_at;")
    show_calories=[]
    calories_won=complete_nil_fields(calories_won)
    calories_lost=complete_nil_fields(calories_lost)

    for day in (0...calories.count)
      calories_won[day].empty? ? calory_won = 0 : calory_won = calories_won[day][1]
      calories_lost[day].emty? ? calory_lost = 0 : calory_lost = calories_lost[day][1]
      show_calories << {created_at: calories[day][0].to_date , calories_won: calory_won, calories_lost: calory_lost}
    end

    return show_calories
  
  end


        # def calories_data
    #     user = current_user.id
    #     time_ago = 2.weeks.ago
    #     calories = Calory.where(user_id: user)
    #     # calories_by_day = total_grouped_by_day(time_ago, calories)
        
        
    #     calories_by_day = calories_by_day[0]
    #     value_by_day = calories_by_day[1]
        
    #     (time_ago.to_date..Date.today).map do |date|
    #       i++
    #       date = calories_by_day[date].first.try(:total_value) || 0
    #       {created_at: date, value: curr_value}
    #     end

    # end
   
    # def total_grouped_by_day(time_ago, curr_calories)
    #     calories = curr_calories.where(created_at: time_ago.beginning_of_day..Time.now)
    #     # calories = curr_calories.where("created_at > #{time_ago.to_date}")
    #     calories = calories.group("date(created_at)")
    #     calories = calories.select("created_at, sum(value) as total_value")
    #     calories.group_by { |c| c.created_at.to_date}
    # end
    
        # calories_lost = user.where( type_value: 'lost').collect { |v| [m.value] [v.create_at] }
        # calories_won = user.where( type_value: 'won').collect { |m| [m.value] }
    #     calories = [
    #         {created_at: '1',won: 500, lost: 600},
    #         {created_at: '2',won: 330, lost: },
    #         {created_at: '3',won: 950, lost: 250},
    #         {created_at: '4',won: , lost: 560},
    #         {created_at: '5',won: 879, lost: 720}
    # ]


end
