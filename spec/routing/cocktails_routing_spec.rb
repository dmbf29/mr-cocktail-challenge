require "rails_helper"

begin
  require "cocktails_controller"
rescue LoadError
end

if defined?(CocktailsController)

  RSpec.describe CocktailsController, :type => :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/cocktails").to route_to("cocktails#index")
      end

      it "routes to #new" do
        expect(:get => "/cocktails/new").to route_to("cocktails#new")
      end

      it "routes to #show" do
        expect(:get => "/cocktails/1").to route_to("cocktails#show", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/cocktails").to route_to("cocktails#create")
      end

    end
  end

end