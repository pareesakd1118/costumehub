require 'rails_helper'

RSpec.describe 'costumes/_costume', type: :view do
  it 'displays the costume details correctly' do
    costume = Costume.create!(name: 'Corpse Bride', category: 'spooky', description: 'Tattered dress with blue wig')

    render partial: 'costumes/costume', locals: { costume: costume }

    expect(rendered).to have_content('Corpse Bride')
    expect(rendered).to have_content('Spooky')
    expect(rendered).to have_content('Tattered dress with blue wig')
  end
end
