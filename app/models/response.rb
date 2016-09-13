class Response < ActiveRecord::Base
  belongs_to :question
  validates :author, :content, :presence => true
  before_create :votes_zero
  def votes_zero
    self.votes = 0
  end
end
