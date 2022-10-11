class Contacts
    def initialize
        @contacts = []
    end

    def add(entry)
        @contacts << entry.join(', ')
    end

    def list_contacts
        return @contacts
    end
end