module Api
  module V1
    class WeightsController < ApplicationController

      # TODO figure out what this does. Is it a security risk.
      skip_before_filter :verify_authenticity_token

      respond_to :html, :json

      def index
        render plain: "Nothing to see here"
      end

      def create
        # Need to create some kind of authentication
        # Not sure why cat_id is inside of weight hash in params

        user = User.find_by_scale_id params[:scale_id]
        if user && user.scale_password == params[:scale_password]
          cat = user.cats.first

          respond_to do |format|
            format.html do
              weight = Weight.create(amount: params[:weight_amount], cat_id: cat.id)
              render plain: "Success! #{weight.amount} saved for #{cat.name}"
              # respond_with :api, :v1, weight
            end

            format.json do
              weight = Weight.create(amount: params[:weight_amount], cat_id: cat.id)
              render plain: "Success! #{weight.amount} saved for #{cat.name}"
              # respond_with :api, :v1, weight
            end
          end
        else
          render plain: "Authentication Failed. All your bases are belong to us"
        end
      end
    end
  end
end



# Test post command
# curl -H "Content-Type: application/json" -d '{"weight_amount":"11.5",  "cat_id":"30", "scale_id": "001"}' http://localhost:3000/api/v1/weights
# curl -H "Content-Type: application/json" -d '{"weight_amount":"12",    "cat_id":"30", "scale_id": "001"}' http://localhost:3000/api/v1/weights
# curl -H "Content-Type: application/json" -d '{"weight_amount":"14.5",  "cat_id":"30", "scale_id": "001"}' http://localhost:3000/api/v1/weights
# curl -H "Content-Type: application/json" -d '{"weight_amount":"15.0",  "cat_id":"30", "scale_id": "001"}' http://localhost:3000/api/v1/weights
# curl -H "Content-Type: application/json" -d '{"weight_amount":"13.75", "cat_id":"30", "scale_id": "001"}' http://localhost:3000/api/v1/weights
