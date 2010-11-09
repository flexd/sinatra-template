# example model

class Replay
  include Mongoid::Document
  field :name
  field :description
  
  validates_presence_of :name
  validates_presence_of :description
end


