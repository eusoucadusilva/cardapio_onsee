class Recipe < ActiveRecord::Base
  attr_accessible :title, :description, :user

  belongs_to :user

  delegate :email, :name, to: :user, allow_nil: true, prefix: true

  validates :title, :description, presence: true

  scope :three_last, lambda {
    order { created_at.desc }.limit(3)
  }
end
