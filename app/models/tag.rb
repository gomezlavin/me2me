class Tag < ActiveRecord::Base
  attr_accessible :word

  has_many :message_tags
  has_many :messages, through: :message_tags
end
