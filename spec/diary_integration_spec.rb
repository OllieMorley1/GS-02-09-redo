require 'Diary'
require 'Diary_entry'
require 'Contacts'
require 'Todo'

RSpec.describe Diary do
    it 'adds and reads back instances of DiaryEntry' do
        diary = Diary.new
        entry = DiaryEntry.new('contents')
        diary.add(entry.contents)
        expect(diary.read).to eq ['contents']
    end

    it 'adds and reads back multiple entries' do
        diary = Diary.new
        entry1 = DiaryEntry.new('entry1')
        entry2 = DiaryEntry.new('entry2')
        diary.add(entry1.contents)
        diary.add(entry2.contents)
        expect(diary.read).to eq ['entry1', 'entry2']
    end

    it 'tests closest entry selected' do
        diary = Diary.new
        entry1 = DiaryEntry.new('contents ' *2)
        entry2 = DiaryEntry.new('contents ' *4)
        entry3 = DiaryEntry.new('contents ' *6)
        diary.add(entry1.contents)
        diary.add(entry2.contents)
        diary.add(entry3.contents)
        expect(diary.suggest(5, 1)).to eq [entry2.contents]
    end
    it 'tests if closest exactly matches' do
        diary = Diary.new
        entry1 = DiaryEntry.new('contents ' *2)
        entry2 = DiaryEntry.new('contents ' *5)
        entry3 = DiaryEntry.new('contents ' *6)
        diary.add(entry1.contents)
        diary.add(entry2.contents)
        diary.add(entry3.contents)
        expect(diary.suggest(5, 1)).to eq [entry2.contents]
    end

    it 'tests todo integration into diary' do
        diary = Diary.new
        todo_list = TodoList.new
        entry1 = DiaryEntry.new('entry1', true)
        entry2 = DiaryEntry.new('entry2')
        todo_list.add(entry1.extract_todo)
        todo_list.add(entry2.extract_todo)
        expect(diary.todo(todo_list)).to eq [entry1.contents]
    end

    it 'tests contacts integration into diary' do
        diary = Diary.new
        contacts = Contacts.new
        entry1 = DiaryEntry.new('hello 123 07756621319')
        contacts.add(entry1.extract_no)
        expect(diary.contacts(contacts)).to eq ['07756621319']
    end
end

