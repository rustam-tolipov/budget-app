module ApplicationHelper
  def avatar_url(user)
    user.avatar.attached? ? user.avatar.variant(resize: '300x300') : 'https://www.w3schools.com/howto/img_avatar.png'
  end
end
