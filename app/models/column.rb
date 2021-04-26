class Column < ApplicationRecord
  belongs_to :battery
  # belongs_to :building, optional: true
  has_many :elevators
end
