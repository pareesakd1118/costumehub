require 'rails_helper'

RSpec.describe Costume, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      costume = Costume.new(name: 'Corpse Bride', category: "spooky", description: "Emily from the corpse bride. You need a tattered dress and a veil and a blue wig")
      expect(costume).to be_valid
    end

    it 'is not valid without a name' do
      costume = Costume.new(category: "spooky", description: "Emily from the corpse bride. You need a tattered dress and a veil and a blue wig")
      expect(costume).not_to be_valid
    end

    it 'is not valid without a category' do
      costume = Costume.new(name: 'Corpse Bride', description: "Emily from the corpse bride. You need a tattered dress and a veil and a blue wig")
      expect(costume).not_to be_valid
    end

    it 'is not valid without a category not included in the specified options' do
      costume = Costume.new(name: 'Corpse Bride', category: "horror", description: "Emily from the corpse bride. You need a tattered dress and a veil and a blue wig")
      expect(costume).not_to be_valid
    end

    it 'is not valid without a description' do
      costume = Costume.new(name: 'Corpse Bride', category: "spooky")
      expect(costume).not_to be_valid
    end
  end
end
