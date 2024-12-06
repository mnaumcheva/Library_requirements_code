note
	description: "Abstract catalog of generic items"
	author: "Maria Naumcheva"

deferred class
    CATALOG [CATALOG_ITEM]

feature

    count: INTEGER
      -- Number of elements in catalog

    is_empty: BOOLEAN
      -- Is catalog empty?
        deferred
        ensure
            Result = (count = 0)
        end

    has (el: CATALOG_ITEM): BOOLEAN
      -- Is el an element of catalog?
        deferred
        ensure
            not_found_in_empty: Result implies not is_empty
        end

    add (element: CATALOG_ITEM)
      -- Add a new element to catalog
        deferred
        ensure
            count = 1 + old count
        end

    remove (element: CATALOG_ITEM)
      -- Remove element from catalog
        deferred
        ensure
            count = old count - 1
        end

end

