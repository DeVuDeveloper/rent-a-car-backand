require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/signup' do
    post('create registration') do
      tags 'User Registration'
      consumes 'application/json'
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            name: { type: :string },
            email: { type: :string },
            password: { type: :string },
            password_confirmation: { type: :string }
          }
        },
        required: %w[name email password password_confirmation]
      }

      response '200', 'blog created' do
        let(:signup) do
          { user: { name: 'foo', email: 'some@gmail.com', password: '123456', password_confirmation: '123456' } }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:signup) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
