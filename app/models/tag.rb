class Tag < ActiveRecord::Base
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.all_ticket_totals
    TicketTag.group(:tag_id).count
  end

  def self.all_sorted
    Tag.all.sort_by { |tag| tag.name }
  end

  def to_s
    self.name
  end
end
