class Conversation < ActiveRecord::Base
  attr_accessible :content, :id, :title, :user_id
end
