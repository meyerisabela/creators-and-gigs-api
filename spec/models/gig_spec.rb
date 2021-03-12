require 'rails_helper'

describe Gig do
  creator = Creator.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  let(:create_gig) { Gig.create(brand_name: Faker::Company.name, creator: creator) }

  it 'a gig should have a brand_name' do
    expect(create_gig.valid?).to eq(true)
    expect(Gig.new(brand_name: '', creator: creator).save).to eq(false)
  end

  it 'a gig should have an applied value for state by default' do
    expect(create_gig.state).to eq('applied')
  end

  describe '#gig_payments_relation' do
    it 'when a gig state is changed to completed, gig payment should be created' do
      gig = create_gig
      gig.state = 'completed'

      expect { gig.save }.to change { GigPayment.count }.by(1)
    end
  end
end
