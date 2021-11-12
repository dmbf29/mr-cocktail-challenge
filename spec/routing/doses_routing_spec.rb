require "rails_helper"

begin
  require "doses_controller"
rescue LoadError
end

if defined?(DosesController)

  RSpec.describe DosesController, :type => :routing do
    describe "routing" do

      it "routes to #new" do
        expect(:get => "/cocktails/1/doses/new").to route_to(controller: "doses", action: "new", cocktail_id: "1")
      end

      it "routes to #create" do
        expect(:post => "/cocktails/1/doses").to route_to(controller: "doses", action: "create", cocktail_id: "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/doses/1").to route_to(controller: "doses", action: "destroy", id: "1")
      end

    end
  end

end