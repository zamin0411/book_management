class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { maximum: 25 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['books']
  end
end
