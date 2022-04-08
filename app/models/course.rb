class Course < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :students, :through => :seats
end
