class Lineup < ApplicationRecord
  belongs_to :student
  belongs_to :waitlist
end
