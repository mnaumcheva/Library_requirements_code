note
	description: "Environment class for BOOK"
	author: "Maria Naumcheva"

deferred class
	BOOK

feature
        -- is_available initialized to True
        -- is_on_hold, is_checked_out, is_due initialized to False
	is_available: BOOLEAN
	is_on_hold: BOOLEAN
	is_checked_out: BOOLEAN
	is_due: BOOLEAN
	patron: PATRON

	    place_hold (p: PATRON)
	    -- Place a hold on a book. Set is_on_hold
        require
            is_available
        deferred
        ensure
            is_on_hold
            not is_available
        end

    checkout (p: PATRON)
        -- Check out the book
        require
            is_on_hold
        deferred
        ensure
            is_checked_out
        end

    return
        -- Return the book to the library
        require
            is_checked_out or is_due
        deferred
        ensure
            is_available
        end

invariant
	is_available implies not (is_on_hold or is_checked_out or is_due)
	is_on_hold implies not (is_available or is_checked_out or is_due)
	is_checked_out implies not (is_available or is_on_hold or is_due)
	is_due implies not (is_available or is_on_hold or is_checked_out)

end
