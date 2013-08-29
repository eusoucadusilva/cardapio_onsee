class Recipe < ActiveRecord::Base
  attr_accessible :title, :description, :user, :avatar
  has_attached_file :avatar, styles: { medium: '324x200i', thumb: '100x100' }, default_url: "missing.png"

  belongs_to :user

  delegate :email, :name, to: :user, allow_nil: true, prefix: true

  validates :title, :description, :avatar, :user, presence: true

  scope :three_last, lambda {
    order { created_at.desc }.limit(3)
  }

  scope :my_recipes, lambda { |user_id|
    where { |recipe|
      recipe.user_id.eq(user_id)
    }
  }
end
