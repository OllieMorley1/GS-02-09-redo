require 'Todo'

RSpec.describe TodoList do
    it 'constructs' do
        list = TodoList.new
        list.add('Testing')
        expect(list.list_tasks).to eq ['Testing']
    end
end