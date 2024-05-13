class Book < ApplicationRecord
  belongs_to :category
  enum :status, %i[draft published], validate: true, default: :draft

  validates :name, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :image, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[author description image name status category]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['category']
  end
end
