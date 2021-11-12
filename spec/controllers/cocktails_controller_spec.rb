require 'rails_helper'
begin
  require "cocktails_controller"
rescue LoadError
end

if defined?(CocktailsController)
  RSpec.describe CocktailsController, :type => :controller do

    let(:valid_attributes) do
      {
        name: "Mojito"
      }
    end

    let(:invalid_attributes) do
      { name: "" }
    end

    describe "GET index" do
      it "assigns all cocktails as @cocktails" do
        cocktail = Cocktail.create! valid_attributes
        get :index, params: {}
        expect(assigns(:cocktails)).to eq([cocktail])
      end
    end

    describe "GET show" do
      it "assigns the requested cocktail as @cocktail" do
        cocktail = Cocktail.create! valid_attributes
        get :show, params: {:id => cocktail.to_param}
        expect(assigns(:cocktail)).to eq(cocktail)
      end
    end

    describe "GET new" do
      it "assigns a new cocktail as @cocktail" do
        get :new, params: {}
        expect(assigns(:cocktail)).to be_a_new(Cocktail)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Cocktail" do
          expect {
            post :create, params: {:cocktail => valid_attributes}
          }.to change(Cocktail, :count).by(1)
        end

        it "assigns a newly created cocktail as @cocktail" do
          post :create, params: {:cocktail => valid_attributes}
          expect(assigns(:cocktail)).to be_a(Cocktail)
          expect(assigns(:cocktail)).to be_persisted
        end

        it "redirects to the created cocktail" do
          post :create, params: {:cocktail => valid_attributes}
          expect(response).to redirect_to(Cocktail.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved cocktail as @cocktail" do
          post :create, params: {:cocktail => invalid_attributes}
          expect(assigns(:cocktail)).to be_a_new(Cocktail)
        end

        it "re-renders the 'new' template" do
          post :create, params: {:cocktail => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end
  end

else
  describe "CocktailsController" do
    it "should exist" do
      expect(defined?(CocktailsController)).to eq(true)
    end
  end
end
