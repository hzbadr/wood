class Customer < User

  def password_required?
    false
  end
end
