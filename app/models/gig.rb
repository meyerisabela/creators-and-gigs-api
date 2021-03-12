class Gig < ApplicationRecord
  belongs_to :creator
  has_one :gig_payment

  before_save :create_gig_payment, if: :state_is_completed?

  validates_presence_of :brand_name

  states = %w[applied accepted completed paid]
  validates_inclusion_of :state, in: states

  private

  def create_gig_payment
    build_gig_payment
  end

  def state_is_completed?
    state == 'completed'
  end
end
