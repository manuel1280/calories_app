module CaloriesHelper

  def calory_author(calory)
    user_signed_in? && current_user.id == calory.user_id
  end

end
