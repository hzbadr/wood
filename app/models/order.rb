class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :created_by, class_name: 'User'
  
  has_many :line_items, dependent: :destroy, inverse_of: :order
  has_many :payments, as: :payable, dependent: :destroy

  validates :number, :customer_id, :state, :total, presence: true

  before_validation :generate_order_number, on: :create

  before_validation :set_default_state, on: :create

  before_validation :update_order_total, on: :create

  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: ->(item){item[:variant_id] .nil?}


  CREATED, PENDING, PROCESSING, COMPLETED, CANCELED = STATES = %w(created pending processing completed canceled)

  STATES.each do |s|
    define_method "#{s}?" do
      self.state == s
    end

    scope s.to_sym, ->(){where(state: s)}
  end

  #order amount
  def amount
    line_items.inject(0.0) { |sum, li| sum + li.amount }
  end

  private
    # from spree
    def generate_order_number(digits = 9)
      self.number ||= loop do
         # Make a random number.
         random = "R#{Array.new(digits){rand(10)}.join}"
         # Use the random  number if no other order exists with it.
         if self.class.exists?(number: random)
           # If over half of all possible options are taken add another digit.
           digits += 1 if self.class.count > (10 ** digits / 2)
         else
           break random
         end
       end
    end

    def set_default_state
      self.state = CREATED
    end

    # total is the remaining (amount - payments)
    def update_order_total
      self.total = line_items.pluck(:price).sum
    end
end
