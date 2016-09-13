class Response < ActiveRecord::Base
  belongs_to :question
  validates :author, :content, :presence => true
end
