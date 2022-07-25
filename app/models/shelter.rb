class Shelter < ActiveRecord::Base
    has_many :pets
    
    has_many :adopters, through: :pets
    def current_pets
        self.pets.all.filter do |pet|
            pet.adopted?
        end
    end
    def adopted_pets
        self.pets.all.filter do |pet|
            !pet.adopted?
        end
    end
end
