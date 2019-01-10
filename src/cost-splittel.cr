require "kemal"
require "./services/payments"
require "json"

service = Services::Payments.new(PaymentsRegisterRepository.new)

post "/registers" do |env|
  env.response.status_code = 201
  env.response.content_type = "application/json"
  {
    "register_id" => service.create.id.to_s
  }.to_json
end

post "/registers/participants" do |env|
  env.response.status_code = 201
  env.response.content_type = "application/json"

  register_id = env.params.json["register_id"].as(String)
  participant_id = env.params.json["participant_id"].as(String)

  if register_id && participant_id
    service.add_participant(UUID.new(register_id), UUID.new(participant_id))
  end

  ({} of String => String).to_json
end

Kemal.run

