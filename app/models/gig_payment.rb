class GigPayment < ApplicationRecord
  belongs_to :gig

  before_save :change_gig_state, if: :state_is_completed?

  states = %w[pending completed]
  validates_inclusion_of :state, in: states

  private

  def change_gig_state
    self.gig.update(state: 'paid')
  end

  def state_is_completed?
    self.state == 'completed'
  end
end
