class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_and_belongs_to_many :tickets
  accepts_nested_attributes_for :tickets
  has_many :orderdetails, dependent: :destroy
  has_many :orders, through :orderdetails

  has_one_attached :photo

end
