require 'swagger_helper'

describe 'Api::V1::Reservations', type: :request do
  path '/api/v1/reservations' do
    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservations found' do
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          treatment: { type: :string },
          description: { type: :string },
          image: { type: :string },
          duration: { type: :integer },
          user_id: { type: :integer },
          spa_service_id: { type: :integer }
        },
        required: %w[treatment duration user_id spa_service_id]
      }

      response '201', 'reservation created' do
        let(:reservation) { { treatment: 'Massage', duration: 60, user_id: 1, spa_service_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { treatment: 'Massage' } }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'reservation found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 treatment: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 duration: { type: :integer },
                 user_id: { type: :integer },
                 spa_service_id: { type: :integer }
               },
               required: %w[id treatment duration user_id spa_service_id]

        let(:id) { Reservation.create(treatment: 'Massage', duration: 60, user_id: 1, spa_service_id: 1).id }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'reservation deleted' do
        let(:id) { Reservation.create(treatment: 'Massage', duration: 60, user_id: 1, spa_service_id: 1).id }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
