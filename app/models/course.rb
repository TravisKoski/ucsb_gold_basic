class Course < ApplicationRecord
    has_many :seats, :dependent => :destroy
    has_many :students, :through => :seats

    after_initialize :default_values
    attr_accessor :update_full_flag

    def default_values
        self.isFull ||= false
    end
    def update_full_flag
        if self.students.length() >= self.capacity
            self.update_attribute(:isFull, true)
        else
            self.update_attribute(:isFull, false)
        end
    end
end
