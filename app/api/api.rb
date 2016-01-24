class API < Grape::API

  prefix 'api'
  version 'v1', using: :path

  mount ApiCustomer::DataPoint
  add_swagger_documentation

end
