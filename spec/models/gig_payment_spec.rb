require 'rails_helper'

describe GigPayment do
  creator = Creator.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  gig = Gig.create(brand_name: Faker::Company.name, creator: creator)

  it 'a gig payment should have an pending value for state by default' do
    gig.update(state: 'completed')
    expect(gig.gig_payment.state).to eq('pending')
  end

  describe '#gig_relation' do
    it 'when a gig payment state is changed to completed, gig state should change to paid' do
      gig.gig_payment.update(state: 'completed')

      expect(gig.state).to eq('paid')
    end
  end
end
