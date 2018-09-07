class Tag < ActiveRecord::Base
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.ticket_totals
    TicketTag.group(:tag_id).count
  end

  def to_s
    self.name
  end
end
