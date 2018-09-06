class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, foreign_key: 'creator', class_name: 'User'
  belongs_to :assignee, foreign_key: 'assignee', class_name: 'User'
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }
end
