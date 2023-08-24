require 'swagger_helper'

describe 'Api::V1::SpaServices', type: :request do
  path '/api/v1/spa_services' do
    get 'Retrieves all spa services' do
      tags 'Spa Services'
      produces 'application/json'

      response '200', 'spa services found' do
        run_test!
      end
    end
  end

  path '/api/v1/spa_services/{id}' do
    get 'Retrieves a spa service' do
      tags 'Spa Services'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'spa service found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image: { type: :string },
                 description: { type: :string },
                 price: { type: :number }
               },
               required: %w[id name price]

        let(:id) { SpaService.create(name: 'Massage', price: 60.0).id }
        run_test!
      end

      response '404', 'spa service not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
