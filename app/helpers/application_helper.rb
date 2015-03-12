module ApplicationHelper

	def humanize secs
	  [[60, 'second'], [60, 'minute'], [24, 'hour'], [1000, 'day']].map{ |count, name|
	    if secs > 0
	      secs, n = secs.divmod(count)
	      if n.to_i > 0
	      	"#{pluralize(n.to_i, name)}"
	      end
	    end
	  }.compact.reverse.join(' ')
	end

end
