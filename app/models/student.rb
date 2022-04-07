class Student < ApplicationRecord
    has_many :seats
    has_many :courses, :through => :seats
end
