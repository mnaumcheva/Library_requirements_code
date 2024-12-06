note
	description: "Core system class for LMS."
	author: "Maria Naumcheva"

deferred class
    LIBRARY

feature
    has_patron(p:PATRON) : BOOLEAN
      -- Is p an active patron of the library?
        deferred
        end

    has_book(b:BOOK): BOOLEAN
      -- Is b in the library's catalogue?
        deferred
        end

	book_is_on_hold (b:BOOK; p:PATRON):BOOLEAN
		deferred
		end

    place_book_on_hold (b:BOOK; p:PATRON)
      -- Reserve a book b by patron p
        deferred
        ensure
            old p.num_reserved < 5 implies (b.is_on_hold and b.patron.is_equal(p) and p.num_reserved=old p.num_reserved+1)
            old p.num_reserved >= 5 implies (b.is_available and p.num_reserved = old p.num_reserved)
        end
end
