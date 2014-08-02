class User < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :profile_name, presence: true, uniqueness: true

	has_many :statuses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def full_name
		first_name.capitalize + " " + last_name.capitalize
	end         
end
