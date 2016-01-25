class API < Grape::API

  prefix 'api'
  version 'v1', using: :path

  mount ApiCustomer::DataPoint
  
  add_swagger_documentation(
      api_version: "v1",
      hide_documentation_path: true,
      #mount_path: "/api/v1/swagger_doc",
      hide_format: true,
      markdown: GrapeSwagger::Markdown::RedcarpetAdapter.new
    )

end
