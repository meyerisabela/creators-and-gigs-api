require 'rails_helper'

describe Creator do
  it 'a creator should have a first_name' do
    expect(Creator.new(first_name: '', last_name: Faker::Name.last_name).save).to eq(false)
    expect(Creator.new(first_name: Faker::Name.first_name, last_name: '').save).to eq(true)
  end

  describe '#gigs_relation' do
    it 'a creator should have many gigs' do
      should respond_to(:gigs)
    end
  end
end
