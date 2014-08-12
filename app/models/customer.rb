class Customer < User
  before_create :set_user_name

  def password_required?
    false
  end

  def set_user_name
    user_name = "#{full_name}-#{email}-#{('a'..'z').to_a.sample(5).join}"
  end
end
