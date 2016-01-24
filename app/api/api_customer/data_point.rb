module ApiCustomer
  class DataPoint < Grape::API

    resource :customer_data do
      desc "List all Customers"

      get '' do
        ::Customer.all
      end

    end
  end
end
