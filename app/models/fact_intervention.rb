class FactIntervention < ApplicationRecord
    belongs_to :building, optional: true
    belongs_to :employee, optional: true
    establish_connection(:postgresDB)
    self.table_name = "fact_interventions"
end
