class Calory < ApplicationRecord
    belongs_to :user

    validates :value, :type_value, :comment, presence: true
    validates :comment, length: { maximum: 250, too_long: "%{count} characters is the maximum allowed. "}
    validates :value, numericality: true

    default_scope {order("created_at desc")}

    TYPE_VALUE = %w{ Lost Won }

    def self.total_grouped_by_day(time_ago)
        # calories = current_user.calories.where(created_at: time_ago.beginning_of_day..Time.now)
        calories = self.where("created_at > ?", time_ago.to_date)
        calories = calories.group("created_at")
        calories = calories.select("created_at, sum(value) as total_value")
        calories.group_by { |c| c.created_at.to_date} 
    end

    def self.search(date,comment)
        if !date.blank? and !comment.blank?
            where(["created_at::TIMESTAMP::DATE = ? and comment LIKE ?", date ,"%#{comment}%"])
          elsif !comment.blank?
            where(["comment LIKE ?", "%#{comment}%"])
          elsif !date.blank?
            where(["created_at::TIMESTAMP::DATE = ?", date])
          else
            self.all
        end
    end

    # scope :search_date, ->(date) {where(["created_at::TIMESTAMP::DATE = ?", date])} if !date.blank?
    # scope :search_comment, ->(comment) {where(["comment LIKE ?", "%#{comment}%"])} if !comment.empy?
    # scope :search_both, ->(date,comment) {search_date.search_comment} if !date.blank? and !comment.blank?
end

