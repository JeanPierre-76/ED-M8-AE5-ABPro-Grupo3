class User < ApplicationRecord

  has_many :orders
  has_many :products

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:vendedor, :admin]

    def rol_por_defecto
      self.role ||= :vendedor
    end

  has_one_attached :avatar

end
