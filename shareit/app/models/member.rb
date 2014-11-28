class Member < ActiveRecord::Base
  belongs_to :board
  belongs_to :list

  def Member.addNew(b, l)
  	m = Member.create
	m.list = l
	m.board = b
  end
end
