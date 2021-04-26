class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true
  has_many :quote, dependent: :destroy
  validates :name, presence: true

  def admin?
    role.name == 'Admin'
  end

  def regular?
    role.name == 'Regular'
  end

  def employee?
    role.name == 'Employee'
  end
end
