class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  validates :name, presence: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password,
                  :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
end
