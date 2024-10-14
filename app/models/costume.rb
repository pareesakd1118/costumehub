class Costume < ApplicationRecord
    validates :name, presence: true
    validates :type, presence: true
    validates :description, presence: true
end
