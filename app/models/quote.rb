class Quote < ActiveRecord::Base
  validates :message, presence: true
end
