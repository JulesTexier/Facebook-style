class Gossip < ApplicationRecord
  validates :title, presence: true,
  length: { in: 3..14 }

  validates :content, presence: true

  belongs_to :user

  has_many :linktags
  has_many :tags, through: :linktags

  has_many :likes, dependent: :destroy

  has_many :comments

end
