# spec/controllers/costumes_controller_spec.rb
require 'rails_helper'

RSpec.describe CostumesController, type: :controller do
  let(:valid_attributes) do
    { name: 'Corpse Bride', category: 'spooky', description: 'Tattered dress and a blue wig' }
  end

  let(:invalid_attributes) do
    { name: '', category: '', description: '' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Costume.create!(valid_attributes)
      get :index
      expect(response).to be_successful # status 200
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      costume = Costume.create!(valid_attributes)
      get :show, params: { id: costume.to_param }
      expect(response).to be_successful # status 200
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Costume' do
        expect {
          post :create, params: { costume: valid_attributes }
        }.to change(Costume, :count).by(1)
      end

      it 'redirects to the created costume' do
        post :create, params: { costume: valid_attributes }
        expect(response).to redirect_to(Costume.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Costume' do
        expect {
          post :create, params: { costume: invalid_attributes }
        }.to change(Costume, :count).by(0)
      end

      it 'renders the new template' do
        post :create, params: { costume: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    let(:new_attributes) do
      { name: 'Updated Name' }
    end

    it 'updates the requested costume' do
      costume = Costume.create!(valid_attributes)
      put :update, params: { id: costume.to_param, costume: new_attributes }
      costume.reload
      expect(costume.name).to eq('Updated Name')
    end

    it 'redirects to the costume' do
      costume = Costume.create!(valid_attributes)
      put :update, params: { id: costume.to_param, costume: new_attributes }
      expect(response).to redirect_to(costume)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested costume' do
      costume = Costume.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: costume.to_param }
      }.to change(Costume, :count).by(-1)
    end

    it 'redirects to the costumes list' do
      costume = Costume.create!(valid_attributes)
      delete :destroy, params: { id: costume.to_param }
      expect(response).to redirect_to(costumes_url)
    end
  end
end
