class Creator < ApplicationRecord
  has_many :gigs, dependent: :destroy

  validates_presence_of :first_name

  validates_uniqueness_of :first_name, scope: :last_name
end
