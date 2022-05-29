require 'swagger_helper'

RSpec.describe 'Sessions', type: :request do
  path '/login' do
    post 'Create session' do
      tags 'User'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '200', 'Login Successful' do
        User.create(name: 'Maria', email: 'maria@gmail.com', password: 'secret12345')
        let(:params) do
          { user: {
            email: 'maria@gmail.com',
            password: 'secret12345'
          } }
        end
        run_test!
      end

      response '401', 'Unauthorized' do
        let(:params) { { email: 'wronggmail', password: '123' } }
        run_test!
      end
    end
  end

 path '/logout' do
   delete 'Delete session' do
     tags 'User'
     produces 'application/json'
     security [JWT: {}]
     parameter name: 'Authorization', in: :header, type: :string
     response '200', 'Loged Out' do
       let(:Authorization) do
         let(:Authorization) { "Bearer #{::Base64.strict_encode64('some@gmail.com:secret12345')}" }
         run_test! do |response|
           data = JSON.parse(response.body)
           expect(data.length).to be > 0
         end
       end

       response '401', 'Log out failed' do
         let(:Authorization) { '' }
         run_test!
       end
     end
   end
 end
end
