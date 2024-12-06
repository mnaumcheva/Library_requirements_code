note
	description: "Environment class for PATRON"
	author: "Maria Naumcheva"

deferred class
	PATRON
feature
	num_reserved: INTEGER
	  -- Number of books reseved by the patron

	place_hold (b: BOOK)
	  -- Reserve a book
		require
			b.is_available
			num_reserved < 5
		deferred
		end

invariant
	num_reserved <= 5

end
