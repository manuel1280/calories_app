class Calory < ApplicationRecord
    belongs_to :user


    validates :value, :type_value, :comment, presence: true
    validates :comment, length: { maximum: 250, too_long: "%{count} characters is the maximum allowed. "}
    validates :value, numericality: true
  
    TYPE_VALUE = %w{ Lost Won }
end
