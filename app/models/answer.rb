class Answer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  
  belongs_to :category
  has_many :responses, dependent: :destroy
  has_one_attached :image
  has_many :answercategory
  with_options presence: true do
    validates :title
    validates :question
  end
  with_options numericality: { other_than: 1, message: 'Select' }, presence: true do
    validates :category_id
  end
end
