class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :role, dependent: :destroy
  has_one :cart, dependent: :destroy

  has_many :favorites
  has_many :items, through: :favorites
  has_many :cart_items, through: :cart

  validates_presence_of :email

  validates_uniqueness_of :email

  after_create :create_role
  after_create :create_cart

  accepts_nested_attributes_for :role

  # def generate_role
  #   create_role
  # end

  def is_admin?
    role.admin
  end

  def is_employee?
    role.employee
  end

  def is_user?
    (role.employee.nil? || !role.employee) && (role.admin.nil? || !role.admin)
  end
end
