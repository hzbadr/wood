class Payment < ActiveRecord::Base
  belongs_to :payable, polymorphic: true
  belongs_to :source, class_name: 'User'
  belongs_to :payment_method

  STATES = %w(draft overdue paid refund)

  STATES.each do |s|
    define_method "#{s}?" do
      state == s
    end

    scope s.to_sym, ->(){ where(state: s) }
  end

end
