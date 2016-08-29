class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :article
  belongs_to :user
end
