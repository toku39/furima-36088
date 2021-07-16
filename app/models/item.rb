class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_charges, :prefecture, :shipping_days
  has_one_attached :image
  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :detail
    validates :price, format: { with: /\A[0-9]+\z/ } ,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :image
  end
  
  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_days_id 
  end
end