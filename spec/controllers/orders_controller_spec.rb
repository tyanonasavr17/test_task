require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST #create' do
    context 'с корректными параметрами' do
      it 'создает заказ и редиректит на root_path' do
        post :create, params: { order: { excluded_ingredients: ['ingredient1', 'ingredient2'] } }

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
        unparsed_ingredients = Order.last.excluded_ingredients
        expect(JSON.parse(unparsed_ingredients)).to eq(['ingredient1', 'ingredient2'])
      end
    end

    context 'с отсутствующим параметром order' do
      it 'создает заказ без excluded_ingredients и редиректит на root_path' do
        post :create

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
        expect(Order.last.excluded_ingredients).to eq("[]")
      end
    end
  end

  describe 'GET #orders_list' do
    it 'возвращает список блюд' do

      get :orders_list

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')

      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
    end
  end
end