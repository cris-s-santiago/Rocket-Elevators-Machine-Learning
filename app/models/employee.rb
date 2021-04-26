class Employee < ApplicationRecord
  has_one :user
  has_many :fact_interventions
  has_many :interventions
end
