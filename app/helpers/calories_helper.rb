module CaloriesHelper

  def calorie_author(calorie)
    user_signed_in? && current_user.id == calorie.user_id
  end

end
