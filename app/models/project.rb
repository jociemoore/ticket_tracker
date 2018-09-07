class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy

  validates :name, presence: true

  def total_open_tickets
    open_tickets = self.tickets.select do |ticket|
      ticket[:status] != "fixed"
    end

    open_tickets.size
  end
end
