module CustomerSupplier
  extend ActiveSupport::Concern
  
  included do
    has_many :payments, foreign_key: :source_id

    before_validation :set_user_name, if: ->(u){u.username.blank?}
    
    def password_required?
      false
    end

    def set_user_name
      self.username = "#{full_name}-#{email}-#{('a'..'z').to_a.sample(5).join}"
    end
  end
end