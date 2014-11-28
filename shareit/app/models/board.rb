class Board < ActiveRecord::Base
  belongs_to :user
  has_many :boardlists, :dependent=>:destroy
  has_many :lists, :through=>:boardlists
  has_many :taskitems, :foreign_key=>"volunteer_id"

  def admin_lists
  	b = Board.find(self)
	if b.boardlists
		lists = b.boardlists.collect{|bl| bl.perms=="admin" ? bl.list : nil;}
		return lists
	else
		return nil
	end
  end

  def member_lists
  	b = Board.find(self)
  	if b.boardlists
  		lists = b.boardlists.collect{|bl| bl.perms=="member"? bl.list: nil}
  		return lists
  	else
  		return nil
  	end
  end 

  end
