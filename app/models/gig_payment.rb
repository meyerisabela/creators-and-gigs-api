class GigPayment < ApplicationRecord
  belongs_to :gig

  before_save :state_to_paid, if: :state_is_completed?

  states = %w[pending completed]
  validates_inclusion_of :state, in: states

  def self.pending_state_to_completed
    update(state: 'completed') if self.state == 'pending'
  end

  private

  def state_to_paid
    gig.update(state: 'paid')
  end

  def state_is_completed?
    state == 'completed'
  end
end
