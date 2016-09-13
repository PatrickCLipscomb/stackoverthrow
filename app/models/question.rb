class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  validates :content, :presence => true
end
