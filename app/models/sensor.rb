class Sensor < ApplicationRecord
  has_and_belongs_to_many :nodes
end
