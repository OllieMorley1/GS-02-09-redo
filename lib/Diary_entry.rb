class DiaryEntry
    def initialize(string, bool=false)
        @contents = string
        @todo = bool
    end

    def contents
        return @contents
    end

    def count_words
        words = @contents.split(' ')
        return words.length
    end

    def extract_todo
        if @todo == true then return @contents 
        else return 'No task here!' end
    end

    def extract_no
        return @contents.scan(/0[0-9]{10}/)
    end
end
