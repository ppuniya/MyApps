class Boardlist < ActiveRecord::Base
  belongs_to :board
  belongs_to :list

  def Boardlist.findBoard(u, l)
	 blist = l.boardlists.select {|bl| bl.board.user == u}
	 if blist.blank?
	 	return nil
	 else
	 	return blist.first.board
	 end
  end

end
