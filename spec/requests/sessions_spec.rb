require 'swagger_helper'

RSpec.describe 'devise/sessions', type: :request do
  path '/login' do
    post('create sessions') do
      tags 'User sessions'
      consumes 'application/json'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            email: { type: :string },
            password: { type: :string }
          }
        },
        required: %w[email password]
      }
      response '200', 'loged in' do
        let(:login) do
          { user: { email: 'some@gmail.com', password: '123456' } }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:login) { { email: 'some@some.com', password: '2435' } }
        run_test!
      end
    end
  end

  path '/logout' do
    delete('delete session') do
      tags 'Sessions'
      security [bearer_auth: []]
      response(200, 'successful') do
        response '201', 'Logged Out' do
          let(:Authorization) { "Bearer #{::Base64.strict_encode64('ja@mail.com', password: '1111111')}" }
          run_test!
        end

        response '401', 'authentication failed' do
          let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
          run_test!
        end
      end
    end
  end
end
