require 'Diary_entry'

RSpec.describe DiaryEntry do
    it 'constructs' do
        entry = DiaryEntry.new('Testing')
        expect(entry.contents).to eq 'Testing'
    end

    it 'returns false by default' do
        entry = DiaryEntry.new('Testing')
        expect(entry.extract_todo).to eq 'No task here!'
    end

    it 'true arg overwrites false' do 
        entry = DiaryEntry.new('Testing', true)
        expect(entry.extract_todo).to eq 'Testing'
    end

    it 'extracts a mobile number from given string' do
        entry = DiaryEntry.new('Hello 123 07756621319')
        expect(entry.extract_no).to eq ['07756621319']
    end

    it 'extracts multiple mobile numbers from a given string' do
        entry = DiaryEntry.new('Hello 123 07756621319, no way is that 07535692434')
        expect(entry.extract_no).to eq ['07756621319', '07535692434']
    end

    it 'counts words in string' do
        diary = Diary.new
        entry1 = DiaryEntry.new('contents ' *5)
        expect(entry1.count_words).to eq 5
    end
end
