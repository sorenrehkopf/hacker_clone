class User < ActiveRecord::Base

	has_secure_password

	has_many :posts
	has_many :ratings, class_name: 'Vote'
	has_many :votes, as: :votable
	has_many :thoughts, class_name: 'Comment'
	

	validates :email,
	presence: true,
	uniqueness: {case_sensitive:false}

	validates_presence_of :password, on: :create

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end

end
