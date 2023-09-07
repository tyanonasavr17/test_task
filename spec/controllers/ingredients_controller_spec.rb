require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe 'GET #index' do
    it 'возвращает код 200' do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it 'рендерит index' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end