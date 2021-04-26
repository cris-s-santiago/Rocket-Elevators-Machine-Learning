class Building < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :address
    has_many :batteries
    # has_many :columns
    # has_many :elevators
    has_many :fact_interventions
    has_many :interventions
    has_many :building_details
end
