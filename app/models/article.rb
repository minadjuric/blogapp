class Article < ActiveRecord::Base
	validates :title, presence: true,
				length: { minimum: 5 }
	validates :body, presence: true,
				length: { minimum: 5 }
	belongs_to :category
	has_many :comments, dependent: :destroy
end
