class TodoList
    def initialize
        @tasks = []
    end

    def add(entry)
        @tasks << entry
    end

    def list_tasks
        @tasks.delete('No task here!')
        return @tasks
    end
end