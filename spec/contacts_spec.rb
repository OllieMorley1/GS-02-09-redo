require 'Contacts'

RSpec.describe Contacts do
    it 'constructs' do
        contacts = Contacts.new
        contacts.add(['07756621319'])
        expect(contacts.list_contacts).to eq ['07756621319']
    end

    it 'constructs multiple' do
        contacts = Contacts.new
        contacts.add(['07756621319', '07535692434'])
        expect(contacts.list_contacts).to eq ['07756621319, 07535692434']
    end
end
