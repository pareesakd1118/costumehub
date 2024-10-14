require 'rails_helper'

RSpec.describe 'costumes/show', type: :view do
  let(:costume) do
    Costume.create!(
      name: 'Corpse Bride',
      category: 'spooky',
      description: 'A tattered dress with a blue wig'
    )
  end

  before do
    assign(:costume, costume)
  end

  it 'displays the costume name' do
    render

    expect(rendered).to have_content('Corpse Bride')
  end

  it 'displays the costume category' do
    render

    expect(rendered).to have_content('Spooky')
  end

  it 'displays the costume description' do
    render

    expect(rendered).to have_content('A tattered dress with a blue wig')
  end

  it 'renders a back link to the costumes index' do
    render

    expect(rendered).to have_link('All Costumes', href: costumes_path)
  end
end
