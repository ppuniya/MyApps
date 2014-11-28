module ActiveRecordExtension
	
	extend ActiveSupport::Concern


	def timeconv(strtime)
		minutes, seconds = strtime.split(":").map{|str| str.to_i}
	    return minutes*60 + seconds
	end

	def timeelapsed(qtr, strtime)
		timepart = timeconv(strtime)
		othertime = (qtr.to_i * 15) * 60
		return othertime - timepart
	end
	
	def timebetween(qtr1, strtime1, qtr2, strtime2)
		time1 = timeelapsed(qtr1, strtime1)
		time2 = timeelapsed(qtr2, strtime2)
		if time1 >= time2
			return time1 - time2
		else
			return time2 - time1
		end
	end

	def fieldposition(teamabbr, strpos)
		if !strpos.nil?
			teamabbr1, stryds = strpos.split(" ").map{|str| str}
		else
			teamabbr1 = teamabbr
			stryds = "-1"
		end
		if (teamabbr1 == teamabbr)
			return stryds.to_i
		else
			return (100 - stryds.to_i)
		end
	end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)
