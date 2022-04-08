class Student < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :courses, :through => :seats
end
