module Customer
  class Data < Grape::API

    resource :customer_data do
      desc "List all Customers"

      get '' do
        ::Customer.all
      end

    end
  end
end