class Student < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :courses, :through => :seats
    has_many :lineups, :dependent => :destroy
    has_many :waitlists, :through => :lineups

def self.search(search)
    if search
        self.where(name: search)
    else
        @students = [] # Do not show students that havent been searched
    end
end
end
