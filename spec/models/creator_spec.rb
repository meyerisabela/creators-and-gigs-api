require 'rails_helper'

describe Creator do
  context 'when saving a new creator' do
    context 'when it doesn\'t have a first_name' do
      it 'doesn\'t create the creator' do
        creator = FactoryBot.build(:creator, first_name: nil)
        expect(creator).not_to be_valid
      end
    end

    context 'when it does have a first_name' do
      it 'creates the creator' do
        creator = FactoryBot.build(:creator)
        expect(creator).to be_valid
      end
    end

    context 'when it has a first name and last name that already exists' do
      it 'doesn\'t create the creator' do
        FactoryBot.create(:creator, first_name: 'John', last_name: 'May')
        creator = FactoryBot.build(:creator, first_name: 'John', last_name: 'May')
        expect(creator).not_to be_valid
      end
    end

    it 'a creator should have many gigs' do
      should respond_to(:gigs)
    end
  end
end
