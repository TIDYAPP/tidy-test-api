class API < Grape::API

	add_swagger_documentation

  prefix 'api'
  version 'v1', using: :path
  mount Customer::Data
end