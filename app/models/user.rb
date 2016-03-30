class User < ActiveRecord::Base

	# validates_uniqueness_of :mobile_number
  validates :mobile_number, phone: { possible: false, allow_blank: true, types: [:mobile] }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  def needs_mobile_number_verifying?
    if is_verified
      return false
    end
    # if mobile_number.empty?
    #   return false
    # end
    return true
  end




end
