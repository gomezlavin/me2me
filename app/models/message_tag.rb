class MessageTag < ActiveRecord::Base

  belongs_to :messages
  belongs_to :tags
end
