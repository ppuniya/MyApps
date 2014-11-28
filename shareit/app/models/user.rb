class User < ActiveRecord::Base
	
	has_many :friendships, :dependent=>:destroy
	has_many :friends, :through=>:friendships
	
	has_many :inverse_friendships, :class_name=>"Friendship", :foreign_key=>"friend_id", :dependent=>:destroy
	has_many :inverse_friends, :through=>:inverse_friendships, :source=>:user

	has_many :boards, :dependent=>:destroy
	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :fname, :message => "First name can't be blank"
	validates_presence_of :lname, :message => "Last name can't be blank"
	

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	
	def pendingboard
		u = User.find(self)
		u.boards.each do |b|
			if (b.boardtype == "pending")
				return b
			end
		end
		return nil
	end

	def priorityboard
		u = User.find(self)
		u.boards.each do |b|
			if (b.boardtype == "priority")
				return b
			end
		end
		return nil
	end


	def inactiveboard
		u = User.find(self)
		u.boards.each do |b|
			if (b.boardtype == "inactive")
				return b
			end
		end
		return nil
	end

	def fullname
		u = User.find(self)
		return u.fname + " " + u.lname
	end
end
