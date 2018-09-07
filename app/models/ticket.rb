class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, foreign_key: 'creator', class_name: 'User'
  belongs_to :assignee, foreign_key: 'assignee', class_name: 'User'
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }

  def self.filter_all(params)
    tickets = Ticket.all

    if params[:project] && !params[:project].empty?
      tickets = tickets.select do |ticket|
        ticket[:project_id] == params[:project].to_i
      end
    end

    if params[:status] && !params[:status].empty?
      tickets = tickets.select do |ticket|
        ticket[:status] == params[:status]
      end
    end

    if params[:tag] && !params[:tag].empty?
      tickets = tickets.select do |ticket|
        ticket.tag_ids.include?(params[:tag].to_i)
      end
    end

    tickets
  end
end
