class Email < ApplicationRecord
  has_many :email_objects, dependent: :destroy
  has_many :students, through: => :email_objects
end
