class Plant < ApplicationRecord
    validates :name, :age, :enjoy, :image, presence: true
    validates :enjoy, length: { minimum: 10, 
    too_short: "%{count} characters is the minimum allowed"}

end
