class List < ActiveRecord::Base
  has_many :boardlists, :dependent => :destroy
  has_many :boards, :through => :boardlists
  has_many :shoppingitems, :dependent => :destroy
  has_many :taskitems, :dependent => :destroy
  
  LIST_TYPES = [["Shopping List", "shop"], ["Task Management", "task"]]
  MEMBER_TYPES = [["List Administrator", "admin"], ["List Member", "member"]]

  def allusers
  	l = List.find(self)
	users = l.boardlists.collect{|b| b.board.user}
    users = users.select {|u| !u.nil?}
	return users
  end

  def adminusers
  	l = List.find(self)
	users = l.boardlists.collect{|b| b.board.user if b.perms=="admin"}
    users = users.select {|u| !u.nil?}
    return users
  end

  def memberusers
  	l = List.find(self)
	users = l.boardlists.collect{|b| b.board.user if b.perms=="member"}
    users = users.select {|u| !u.nil?}
	return users
  end
end
