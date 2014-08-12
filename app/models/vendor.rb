class Vendor < User
  def password_required?
    false
  end
end
