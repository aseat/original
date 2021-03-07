class Answer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  has_many :responses, dependent: :destroy
  has_one_attached :image

  with_options numericality: { other_than: 1, message: 'を選択してください' }, presence: true do
    validates :category_id
  end
  with_options presence: true do
    validates :title
    validates :question
  end
  def self.search(search)
    if search != ''
      Answer.where('question LIKE(?)', "%#{search}%")
    else
      Answer.all
    end
  end
end
