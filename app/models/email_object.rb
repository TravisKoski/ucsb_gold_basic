class EmailObject < ApplicationRecord
  belongs_to :email
  belongs_to :student
end
