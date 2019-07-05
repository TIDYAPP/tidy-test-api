GrapeSwaggerRails.options.url      = '/api/v1/swagger_doc'
#GrapeSwaggerRails.options.url      = '/swagger_doc'
if Rails.env.production?
	GrapeSwaggerRails.options.app_url  = "https://tidy-api-test.herokuapp.com"
else 
	GrapeSwaggerRails.options.app_url  = "http://localhost:3000"
end