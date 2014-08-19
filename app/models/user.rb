class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  validates :username, uniqueness: {case_sensitive: false}
  
  default_scope ->(){ order('CONCAT(first_name, last_name)') }

  ransacker :full_name, formatter: proc { |v| v.mb_chars.downcase.to_s } do |parent|
    Arel::Nodes::NamedFunction.new('LOWER',
      [Arel::Nodes::NamedFunction.new('concat_ws',
        [' ', parent.table[:first_name], parent.table[:last_name]])])
  end

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  alias_method :name, :full_name
end
