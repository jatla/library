require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TagsController do

  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :name => "RSpec Test", :description => "RSpec Test" } }
  let(:in_valid_attributes) { { :nam => "RSpec Test", :descriptio => "RSpec Test" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    OmniAuth.config.test_mode = true
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    @tag = create(:tag)
    @tag.save
    @user = create(:user)
    @user.save!
    @admin = create(:admin)
    @admin.save!
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe "GET index" do
    it "assigns all tags as @tags" do
      get :index, {}, valid_session
      assigns(:tags).should eq([@tag])
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      get :show, {:id => @tag.to_param}, valid_session
      assigns(:tag).should eq(@tag)
    end
  end

  context "If user is not signed in" do
    describe "GET new" do
      it "should redirect to home page with sign in help message " do
        get :new, {}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "GET edit" do
      it "should redirect to home page with sign in help message " do
        get :edit, {:id => @tag.to_param}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "POST create" do
      it "should redirect to home page with sign in help message " do
        post :create, {:tag => valid_attributes}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "POST update" do
      it "should redirect to home page with sign in help message " do
        put :update, {:id => @tag.to_param, :tag => { name: "RSpec Test" }}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "DELETE destroy" do
      it "should redirect to home page with sign in help message " do
        delete :destroy, {:id => @tag.to_param}, valid_session
        response.should redirect_to(root_url)
      end
    end
  end

  context "If user is signed in" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      OmniAuth.config.add_mock(:google_oauth2, {:uid => '12345'})
      sign_in @user
    end
    describe "GET new" do
      it "should redirect to home page with sign in help message " do
        get :new, {}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "GET edit" do
      it "should redirect to home page with sign in help message " do
        get :edit, {:id => @tag.to_param}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "POST create" do
      it "should redirect to home page with sign in help message " do
        post :create, {:tag => valid_attributes}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "POST update" do
      it "should redirect to home page with sign in help message " do
        put :update, {:id => @tag.to_param, :tag => { name: "RSpec Test" }}, valid_session
        response.should redirect_to(root_url)
      end
    end
    describe "DELETE destroy" do
      it "should redirect to home page with sign in help message " do
        delete :destroy, {:id => @tag.to_param}, valid_session
        response.should redirect_to(root_url)
      end
    end
  end


  context "If admin is signed in" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:admin]
      OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
      sign_in @admin
    end
    describe "GET new" do
      it "assigns a new tag as @tag" do
        get :new, {}, valid_session
        assigns(:tag).should be_a_new(Tag)
      end
    end

    describe "GET edit" do
      it "assigns the requested tag as @tag" do
        get :edit, {:id => @tag.to_param}, valid_session
        assigns(:tag).should eq(@tag)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Tag" do
          expect {
            post :create, {:tag => valid_attributes}, valid_session
          }.to change(Tag, :count).by(1)
        end

        it "assigns a newly created tag as @tag" do
          post :create, {:tag => valid_attributes}, valid_session
          assigns(:tag).should be_a(Tag)
          assigns(:tag).should be_persisted
        end

        it "redirects to the created tag" do
          post :create, {:tag => valid_attributes}, valid_session
          response.should redirect_to(Tag.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved tag as @tag" do
          post :create, {:tag => in_valid_attributes}, valid_session
          assigns(:tag).should be_a_new(Tag)
        end

        # it "re-renders the 'new' template" do
        #   post :create, {:tag => in_valid_attributes}, valid_session
        #   response.should render_template("new")
        # end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested tag" do
          put :update, {:id => @tag.to_param, :tag => valid_attributes}, valid_session
          assigns(:tag).should eq(@tag)
        end

        it "assigns the requested tag as @tag" do
          put :update, {:id => @tag.to_param, :tag => valid_attributes}, valid_session
          assigns(:tag).should eq(@tag)
        end

        it "redirects to the tag" do
          put :update, {:id => @tag.to_param, :tag => valid_attributes}, valid_session
          response.should redirect_to(@tag)
        end
      end

      describe "with invalid params" do
        it "assigns the tag as @tag" do
          put :update, {:id => @tag.to_param, :tag => in_valid_attributes}, valid_session
          assigns(:tag).should eq(@tag)
        end

        # it "re-renders the 'edit' template" do
        #   put :update, {:id => @tag.to_param, :tag => in_valid_attributes}, valid_session
        #   response.should render_template("edit")
        # end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested tag" do
        expect {
          delete :destroy, {:id => @tag.to_param}, valid_session
        }.to change(Tag, :count).by(-1)
      end

      it "redirects to the tags list" do
        tag = Tag.create! valid_attributes
        delete :destroy, {:id => tag.to_param}, valid_session
        response.should redirect_to(tags_url)
      end
    end

  end
end
