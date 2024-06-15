require 'rails_helper'

RSpec.describe "User", type: :request do
  describe "POST /auth/register" do
    context 'with valid parameters' do
      before do
        post '/api/v1/auth/register', params: {
          user: {
            email: Faker::Internet.email,
            password: Faker::Internet.password(min_length: 8),
          }
        }
      end



      it 'returns a response with status "success"' do
        puts JSON.parse(response.body)
        expect(JSON.parse(response.body)["status"]).to eq("success")
      end

      it 'returns a response with message "User created"' do
        expect(JSON.parse(response.body)["message"]).to eq('User created')
      end

      it "returns a response with no errors" do
        expect(JSON.parse(response.body)["errors"]).to eq(nil)
      end

      it 'returns a response with a valid JWT' do
        token = JSON.parse(response.body)["data"]
        decoded_token = JWT.decode(token, nil, false)
        expect(decoded_token).to be_truthy
        expect(decoded_token).to be_a(Array)
        expect(decoded_token[0]).to be_a(Hash)
      end

      it 'responds with status 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'with invalid parameters' do
      context 'with no email' do
        before do
          post '/api/v1/auth/register', params: {
            user: {
              email: "",
              password: Faker::Internet.password(min_length: 8),
            }
          }
        end

        it 'responds with status "error"' do
          expect(JSON.parse(response.body)["status"]).to eq("error")
        end

        it 'responds with message "User created"' do
          expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Email can't be blank, Email is invalid")
        end

        it 'responds with null data' do
          expect(JSON.parse(response.body)["data"]).to eq(nil)
        end

        it 'responds with list of errors' do
          expect(JSON.parse(response.body)["errors"]["email"][0]).to eq("can't be blank")
          expect(JSON.parse(response.body)["errors"]["email"][1]).to eq("is invalid")
        end

        it 'responds with status 400' do
          expect(response).to have_http_status(400)
        end

      end

      context 'with invalid email format' do
        before do
          post '/api/v1/auth/register', params: {
            user: {
              email: "testgmail.com",
              password: Faker::Internet.password(min_length: 8),
            }
          }
        end

        it 'responds with status "error"' do
          expect(JSON.parse(response.body)["status"]).to eq("error")
        end

        it 'responds with message "User created"' do
          expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Email is invalid")
        end

        it 'responds with status 400' do
          expect(response).to have_http_status(400)
        end

        it 'responds with null data' do
          expect(JSON.parse(response.body)["data"]).to eq(nil)
        end

        context 'with no password' do
          before do
            post '/api/v1/auth/register', params: {
              user: {
                email: Faker::Internet.email,
                password: "",
              }
            }
          end

          it 'responds with status "error"' do
            expect(JSON.parse(response.body)["status"]).to eq("error")
          end

          it 'responds with message "User created"' do
            expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Password can't be blank")
          end

          it 'responds with null data' do
            expect(JSON.parse(response.body)["data"]).to eq(nil)
          end

          it 'responds with list of errors' do
            expect(JSON.parse(response.body)["errors"]["password"].first).to eq("can't be blank")
          end


          it 'responds with status 400' do
            expect(response).to have_http_status(400)
          end
        end
      end
    end
  end
end
