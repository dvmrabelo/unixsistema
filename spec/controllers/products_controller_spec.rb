require 'rails_helper'

describe ProductsController, type: :controller do
	it 'creates a product with valid params' do
		Color.create(name: :azul)
      	Size.create(name: :P)
		get :new

		expect(response).to render_template(:new)

		post :create, product: {name: "Camisa test", description: 'Testando camisa', color_id: 1, size_id: 1 }

		expect(response).to redirect_to(assigns(:product))
	end

	it 'creates a product with invalid params' do
		get :new

		expect(response).to render_template(:new)

		post :create, product: {description: 'Testando camisa', color_id: 1, size_id: 1}

		expect(response).to render_template(:new)
	end
end