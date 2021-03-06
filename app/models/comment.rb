class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :creator, foreign_key: :creator, class_name: 'User'

  validates :body, presence: true

  def updated?
    !self.created_at.eql?(self.updated_at)
  end
end
