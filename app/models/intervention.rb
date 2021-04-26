class Intervention < ApplicationRecord
    belongs_to :building, optional: true
    belongs_to :employee, optional: true
end
