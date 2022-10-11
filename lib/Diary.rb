require 'Diary_entry'
require 'Contacts'
require 'Todo'

class Diary
    def initialize
        @entries = []
    end

    def add(entry)
        @entries << entry
    end

    def read
        return @entries
    end

    def suggest(wpm, time)
        readable = wpm * time
        entry_lengths = @entries.map {|x| count_words(x)}
        suggestion_length = entry_lengths.min_by{|x| (readable-x).abs}
        @entries.filter {|x| count_words(x) == suggestion_length}
    end

    def todo(todo_list)
        return todo_list.list_tasks
    end

    def contacts(contacts)
        return contacts.list_contacts
    end

    private
    def count_words(str)
        words = str.split(' ')
        return words.length
    end
end