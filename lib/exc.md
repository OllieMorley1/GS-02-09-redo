# As a user
# So that I can record my experiences
# I want to keep a regular diary

# As a user
# So that I can reflect on my experiences
# I want to read my past diary entries

# As a user
# So that I can reflect on my experiences in my busy day
# I want to select diary entries to read based on how much time I have and my reading speed

# As a user
# So that I can keep track of my tasks
# I want to keep a todo list along with my diary

# As a user
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers in all my diary entries


# tests user story 1/2
# 1 tests one entry
diary = Diary.new
entry = DiaryEntry.new('contents')
diary.add(entry.contents)
diary.read => 'contents'
# 2 tests multiple entries
diary = Diary.new
entry1 = DiaryEntry.new('entry1')
entry2 = DiaryEntry.new('entry2')
diary.add(entry1.contents)
diary.add(entry2.contents)
diary.read => ['entry2', 'entry1']



# tests user story 3
# 1 tests closest entry selected
diary = Diary.new
entry1 = DiaryEntry.new('contents' *2)
entry2 = DiaryEntry.new('contents' *4)
entry3 = DiaryEntry.new('contents' *6)
diary.add(entry1.contents)
diary.add(entry2.contents)
diary.add(entry3.contents)
diary.suggest(5, 1) => entry2
# 1 tests if closest exactly matches
diary = Diary.new
entry1 = DiaryEntry.new('contents' *2)
entry2 = DiaryEntry.new('contents' *5)
entry3 = DiaryEntry.new('contents' *6)
diary.add(entry1.contents)
diary.add(entry2.contents)
diary.add(entry3.contents)
diary.suggest(5, 1) => entry2



# tests user story 4
# 1 tests extraction of todo based on bool value
diary = Diary.new
todo_list = TodoList.new
entry1 = DiaryEntry.new('entry1', true)
entry2 = DiaryEntry.new('entry2')
todo_list.add(entry1.extract_todo)
todo_list.add(entry2.extract_todo)
todo_list.list_tasks => entry1.contents
# 2 tests integration into diary
diary = Diary.new
todo_list = TodoList.new
entry1 = DiaryEntry.new('entry1', true)
entry2 = DiaryEntry.new('entry2')
todo_list.add(entry1.extract_todo)
todo_list.add(entry2.extract_todo)
diary.todo => entry1



# tests user story 5
# 1 tests extraction of number
diary = Diary.new
contacts = Contacts.new
entry1 = DiaryEntry.new('hello 123 07756621319')
todo_list.add(entry1.extract_no)
todo_list.list_contacts => ['07756621319']
# 2 tests non-extraction of number when called on invalid object
diary = Diary.new
contacts = Contacts.new
entry1 = DiaryEntry.new('hello 123 0')
entry1.extract_no => 'No phone number found'
contacts.list_contacts => 'No phone numbers added'
# 3 tests integration
diary = Diary.new
contacts = Contacts.new
entry1 = DiaryEntry.new('hello 123 07756621319')
contacts.add(entry1.extract_no)
diary.contacts => ['07756621319']