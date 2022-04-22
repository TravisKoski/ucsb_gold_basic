class Student < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :courses, :through => :seats

def self.search(search)
    if search
        self.where(name: search)
    else
        @students = Student.all
    end
end
end
