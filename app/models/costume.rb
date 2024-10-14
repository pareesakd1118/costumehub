class Costume < ApplicationRecord
    CATEGORIES = ["spooky", "funny", "historical", "pun", "cute", "fantasy", "animal", "sexy", "super hero", "pop culture"]

    validates :name, presence: true
    validates :category, presence: true, inclusion: {in: CATEGORIES, message: "%{value} is not a valid category"}
    validates :description, presence: true

    def self.costume_count
        Costume.count
    end
end
