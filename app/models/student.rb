class Student < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :courses, :through => :seats
    has_many :lineups, :dependent => :destroy
    has_many :waitlists, :through => :lineups
    has_many :email_objects, :dependent => :destroy
    has_many :emails, :through => :email_objects

def self.search(search)
    if search
        self.where("lower(replace(name, ' ', '')) LIKE ?", "%" + search.delete(' ') + "%")
    else
        @students = [] # Do not show students that havent been searched
    end
end
end
