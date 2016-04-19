class User < ActiveRecord::Base
  has_many :reminders
  validate :phone_format
	# validates_uniqueness_of :mobile_number
  validates :mobile_number, phone: { possible: false, allow_blank: false, types: [:mobile] }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def needs_mobile_number_verifying?
    if is_verified
      return false
    end

    return true
  end

  def phone_format
    if mobile_number[0] != '1'
      mobile_number.insert(0, '1')
    end
  end


end
