class BuildingDetail < ApplicationRecord
    belongs_to :building
    belongs_to :employee, optional: true
end
