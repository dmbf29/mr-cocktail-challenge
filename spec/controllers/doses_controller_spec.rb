require 'rails_helper'
begin
  require "doses_controller"
rescue LoadError
end

if defined?(DosesController)
  RSpec.describe DosesController, :type => :controller do

    before(:each) do
      @cocktail = Cocktail.create!(name: "Mojito")
      @ingredient = Ingredient.create!(name: "lemon")
    end

    let(:valid_attributes) do
      {
        description: "6cl",
        cocktail_id: @cocktail.id,
        ingredient_id: @ingredient.id
      }
    end

    let(:invalid_attributes) do
      { description: "" }
    end

    describe "GET new" do
      it "assigns a new dose as @dose" do
        get :new, params: { cocktail_id: @cocktail.id }
        expect(assigns(:cocktail)).to eq(@cocktail)
        expect(assigns(:dose)).to be_a_new(Dose)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Dose" do
          expect {
            post :create, params: { cocktail_id: @cocktail.id, :dose => valid_attributes}
          }.to change(Dose, :count).by(1)
        end

        it "assigns a newly created dose as @dose" do
          post :create, params: { cocktail_id: @cocktail.id, :dose => valid_attributes}
          expect(assigns(:dose)).to be_a(Dose)
          expect(assigns(:dose)).to be_persisted
        end

        it "redirects to the created dose" do
          post :create, params: { cocktail_id: @cocktail.id, :dose => valid_attributes}
          expect(response).to redirect_to(@cocktail)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved dose as @dose" do
          post :create, params: { cocktail_id: @cocktail.id, :dose => invalid_attributes}
          expect(assigns(:dose)).to be_a_new(Dose)
        end

        it "re-renders the 'new' template" do
          post :create, params: { cocktail_id: @cocktail.id, :dose => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "DELETE destroy" do
      it "deletes a Dose" do
        @dose = Dose.create!(valid_attributes)
        expect {
          delete :destroy, params: { id: @dose.id }
        }.to change(Dose, :count).by(-1)
      end
    end
  end
else
  describe "DosesController" do
    it "should exist" do
      expect(defined?(DosesController)).to eq(true)
    end
  end
end
