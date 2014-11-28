class Admin < ActiveRecord::Base
  belongs_to :board
  belongs_to :list
  
  def Admin.addNew(b, l)
  	a = Admin.create
	a.list = l
	a.board = b
	a.save
  end
end
