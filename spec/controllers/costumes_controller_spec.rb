# spec/controllers/costumes_controller_spec.rb
require 'rails_helper'

RSpec.describe CostumesController, type: :controller do
  # Example valid attributes
  let(:valid_attributes) do
    { name: 'Corpse Bride', category: 'spooky', description: 'Emily from corpse bride. You need a tattered dress and blue wig and veil' }
  end

  # Example invalid attributes
  let(:invalid_attributes) do
    { name: '', category: '', description: '' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful # status 200
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      resource = Costume.create!(valid_attributes)
      get :show, params: { id: resource.to_param }
      expect(response).to be_successful # status 200
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new resource' do
        expect {
          post :create, params: { costume: valid_attributes }
        }.to change(Costume, :count).by(1)
      end

      it 'redirects to the created resource' do
        post :create, params: { costume: valid_attributes }
        expect(response).to redirect_to(Costume.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new resource' do
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
      { name: 'Emily Corpse Bride' }
    end

    it 'updates the requested resource' do
      resource = Costume.create!(valid_attributes)
      put :update, params: { id: resource.to_param, costume: new_attributes }
      resource.reload
      expect(resource.name).to eq('Emily Corpse Bride')
    end

    it 'redirects to the updated resource' do
      resource = Costume.create!(valid_attributes)
      put :update, params: { id: resource.to_param, costume: new_attributes }
      expect(response).to redirect_to(resource)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested resource' do
      resource = Costume.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: resource.to_param }
      }.to change(Costume, :count).by(-1)
    end

    it 'redirects to the index page' do
      resource = Costume.create!(valid_attributes)
      delete :destroy, params: { id: resource.to_param }
      expect(response).to redirect_to(costumes_url)
    end
  end
end
