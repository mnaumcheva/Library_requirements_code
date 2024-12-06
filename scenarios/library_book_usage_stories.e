note
	description: "Use case stories for LMS"
	author: "Maria Naumcheva"


class
    LIBRARY_BOOK_USAGE_STORIES
feature

    reserve_book_successfully (b: BOOK; lb: LIBRARY; p: PATRON)
        require
            p.num_reserved < 5
            b.is_available
        do
            lb.place_book_on_hold (b, p)
        ensure
            b.is_on_hold
            b.patron = p
        end

    reserve_book_num_holds_exceeded (b: BOOK; lb: LIBRARY; p: PATRON)
        require
            p.num_reserved >= 5
            b.is_available
        do
            lb.place_book_on_hold (b, p)
        ensure
            b.is_available
        end


    holding_available_book_by_two_patrons(b: BOOK; p1, p2: PATRON; l: LIBRARY)
        require
            b.is_available
            p1 /= p2
            l.has_patron (p1)
            l.has_patron (p2)
        do
            l.place_book_on_hold (b, p1)
            l.place_book_on_hold (b, p2)
        ensure
            l.book_is_on_hold (b, p1)
            not l.book_is_on_hold (b, p2)
        end

    -- Other use case stories
end
