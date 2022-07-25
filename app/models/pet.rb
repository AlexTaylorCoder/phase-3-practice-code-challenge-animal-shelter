class Pet < ActiveRecord::Base
    belongs_to :shelter
    belongs_to :adopter
def self.oldest
    self.maximum(:age)
    end
def self.average_age
    self.average(:age)
end
end
