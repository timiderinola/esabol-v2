class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :admin
  has_many :comments

  validates :author, presence: true
  validates :content, presence: true
  validates :title, presence: true
end
