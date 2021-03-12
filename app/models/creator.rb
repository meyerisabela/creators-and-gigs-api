class Creator < ApplicationRecord
  has_many :gigs

  validates_presence_of :first_name
end
