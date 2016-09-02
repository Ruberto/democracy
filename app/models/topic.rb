class Topic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :author

  enum state: { open: 0, closed: 1 }
end
