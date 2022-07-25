class Adopter < ActiveRecord::Base
    has_many :pets
    has_many :shelters, through: :pets
    def adopt(pet)
        pet.update(adopted?: true)
        self.pets << pet
    end
    def full_name
        self.first_name + " " + self.last_name
    end
    def fav_pet
        if self.pets.count === 0
            nil
        else 
            self.pets.group_by {|pet| pet.species}.max_by{|species| species.count}
        end
    end
end
