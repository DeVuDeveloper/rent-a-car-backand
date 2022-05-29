require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/signup' do
    post 'Register a new user' do
      tags 'User Registration'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[name email password]
      }

      response '200', 'User created' do
        let(:params) do
          { user: {
            name: 'Robert',
            email: 'robert@gmail.com',
            password: 'secret12345'
          }}
        end
        run_test!
      end
    end
  end
end
