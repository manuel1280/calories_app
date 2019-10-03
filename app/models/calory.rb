class Calory < ApplicationRecord
    belongs_to :user


    validates :value, :type_value, :comment, presence: true
    validates :comment, length: { maximum: 250, too_long: "%{count} characters is the maximum allowed. "}
    validates :value, numericality: true
  
    TYPE_VALUE = %w{ Lost Won }

    def self.total_grouped_by_day(time_ago)
        # calories = current_user.calories.where(created_at: time_ago.beginning_of_day..Time.now)
        calories = self.where("created_at > ?", time_ago.to_date)
        calories = calories.group("created_at")
        calories = calories.select("created_at, sum(value) as total_value")
        calories.group_by { |c| c.created_at.to_date} 
    end
end
