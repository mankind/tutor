module UsersHelper

  def check_current_user?(user)
    user.id == current_user.id
  end
end
