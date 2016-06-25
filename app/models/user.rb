class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bits

  def full_name
    first = !!self.first_name ? self.first_name : "User"
    last = !!self.last_name ? self.last_name : self.id
    "#{first} #{last}"
  end
end
