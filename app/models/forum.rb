class Forum < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :users, through: :posts

  accepts_nested_attributes_for :posts

  validates :title, presence: true
  validates_associated :posts
end
