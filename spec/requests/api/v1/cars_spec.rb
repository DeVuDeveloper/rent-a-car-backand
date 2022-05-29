# require 'swagger_helper'

# RSpec.describe 'api/v1/cars', type: :request do
#   path '/api/v1/cars' do
#     post 'Creates a car' do
#       tags 'car'
#       consumes 'application/json'

#       parameter name: :params, in: :body, schema: {

#         type: :object,
#         properties: {
#           id: { type: :integer },
#           name: { type: :string },
#           fuel: { type: :string },
#           seats: { type: :integer },
#           navigation: { type: :GPS },
#           car_type: { type: :string },
#           photo: { type: :string },
#           price_for_day: { type: :integer },
#           city: { type: :string }
#         },
#         required: %w[name fuel seats navigation car_type photo price_for-day city]
#       }
#       response '200', 'house created' do
#         let(:params) do
#           { car: { name: 'Ford', fuel: 'Petrol', seats: 4, navigation: 'GPS', car_type: 'middle',
#             photo: 'photo.jpg', price_for_day: 50, city: 'Berlin' } }
#         end
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:house) { { title: 'car 2' } }
#         run_test!
#       end
#     end
#   end
# end
