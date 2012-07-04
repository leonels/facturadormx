class User < ActiveRecord::Base

  belongs_to :account
  validates :account_id, :presence => true, :on => :update

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # attr_accessor :username, :encrypted_password, :locked_at, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
  #   :last_sign_in_ip, :sign_in_count

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
    # :first_name, :last_name, :mobile_phone, :phone_one, :phone_two, :organization_id

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  
  def full_name
    "#{first_name} " + "#{last_name}"
  end
end
