class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :role, dependent: :destroy

  validates_uniqueness_of :email

  after_create :generate_role

  accepts_nested_attributes_for :role

  def generate_role
    self.create_role
  end

  def is_admin?
    self.role.admin
  end

  def is_employee?
    self.role.employee
  end

  def is_user?
    (self.role.employee.nil? || !self.role.employee) && (self.role.admin.nil? || !self.role.admin)
  end
end
