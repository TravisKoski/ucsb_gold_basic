class Course < ApplicationRecord
    has_many :seats
    has_many :students, :through => :seats
end
