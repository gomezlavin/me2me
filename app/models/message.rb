class Message < ActiveRecord::Base
  attr_accessible :title, :idea, :delivery_date, :delivery_time, :last_sent, :times_sent

  belongs_to :user
  has_many :message_tags
  has_many :tags, through: :message_tags
end
