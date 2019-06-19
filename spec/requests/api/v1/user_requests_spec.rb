require "rails_helper"

RSpec.describe "POST /api/v1/users" do
  it "successfully creates a new user" do
    payload = {
      "user": {
        "email": "user@example.com",``
        "first_name": "Jane",
        "last_name": "Doe",
        "password": "password",
        "password_confirmation": "password",
      },
    }

    expect(User.all).to be_empty
    post("/api/v1/users",
         params: payload.to_json,
         headers: { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" })
    expect(response).to be_successful
    expect(response).to have_http_status 201
  end
end
