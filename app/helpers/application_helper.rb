module ApplicationHelper
  def avatar_url(user)
    user.avatar.attached? ? user.avatar.variant(resize: '300x300') : 'img/user.png'
  end
end
