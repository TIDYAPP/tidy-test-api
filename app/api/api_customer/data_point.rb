module ApiCustomer
  class DataPoint < Grape::API

    resource :customer_data do
      desc "List all Customers",
      notes: <<-NOTE
      Example Request
      --------
          http GET http://[api-url]]/api/v1/customer.json
      NOTE

      get '' do
        ::Customer.all
      end

      desc "create a Customer",
      notes: <<-NOTE
      Example Request
      --------
          {
          "customer":  {
            "name": "Joe Doe",
            "email": "joedoe@email.com",
            "phone": "555-555-5555",
            "address": "123 main street",
            "city": "RSM",
            "state": "CA",
            "zipcode": "99999",
          }}

      NOTE
      ## This takes care of parameter validation
      params do

        requires :name, type: String
        requires :email, type: String
        requires :phone, type: String
        requires :address, type: String
        requires :city, type: String
        requires :state, type: String
        requires :zipcode, type: String
        requires :address, type:String

      end
      ## This takes care of creating employee
      post do
        Customer.create!({
          name:params[:name],
          email:params[:email],
          phone:params[:phone],
          address:params[:address],
          city:params[:city],
          state:params[:state],
          zipcode:params[:zipcode]
      })
      end

     desc "delete a Customer",
     notes: <<-NOTE

       Example Request
       --------
           http DELETE http://[api-url]]/api/v1/customer.json/15
     NOTE
     params do
       requires :id, type: String
     end
     delete ':id' do
       Customer.find(params[:id]).destroy!
     end


    desc "update an Customer",
    notes: <<-NOTE
      Example Request
      --------
          {
          "customer":  {
            "name": "Joe Doe",
            "email": "joedoe@email.com",
            "phone": "555-555-5555",
            "address": "123 main street",
            "city": "RSM",
            "state": "CA",
            "zipcode": "99999",
          }}

      NOTE
    params do
      requires :id, type: String
      requires :address, type:String
    end
    put ':id' do
      Customer.find(params[:id]).update({
          name:params[:name],
          email:params[:email],
          phone:params[:phone],
          address:params[:address],
          city:params[:city],
          state:params[:state],
          zipcode:params[:zipcode]
      })
    end

    end
  end
end
