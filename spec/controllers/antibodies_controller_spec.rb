require 'spec_helper'


describe AntibodiesController do

  # This should return the minimal set of attributes required to create a valid
  # Antibody. As you add validations to Antibody, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "Some Antibody name", :description => "Some description"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AntibodiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all antibodies as @antibodies" do
      antibody = Antibody.create! valid_attributes
      get :index, {}, valid_session
      assigns(:antibodies).should eq([antibody])
    end
  end

  describe "GET show" do
    it "assigns the requested antibody as @antibody" do
      antibody = Antibody.create! valid_attributes
      get :show, {:id => antibody.to_param}, valid_session
      assigns(:antibody).should eq(antibody)
    end
  end

  describe "GET new" do
    it "assigns a new antibody as @antibody" do
      get :new, {}, valid_session
      assigns(:antibody).should be_a_new(Antibody)
    end
  end

  describe "GET edit" do
    it "assigns the requested antibody as @antibody" do
      antibody = Antibody.create! valid_attributes
      get :edit, {:id => antibody.to_param}, valid_session
      assigns(:antibody).should eq(antibody)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Antibody" do
        expect {
          post :create, {:antibody => valid_attributes}, valid_session
        }.to change(Antibody, :count).by(1)
      end

      it "assigns a newly created antibody as @antibody" do
        post :create, {:antibody => valid_attributes}, valid_session
        assigns(:antibody).should be_a(Antibody)
        assigns(:antibody).should be_persisted
      end

      it "redirects to the created antibody" do
        post :create, {:antibody => valid_attributes}, valid_session
        response.should redirect_to(Antibody.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved antibody as @antibody" do
        # Trigger the behavior that occurs when invalid params are submitted
        Antibody.any_instance.stub(:save).and_return(false)
        post :create, {:antibody => {}}, valid_session
        assigns(:antibody).should be_a_new(Antibody)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Antibody.any_instance.stub(:save).and_return(false)
        post :create, {:antibody => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested antibody" do
        antibody = Antibody.create! valid_attributes
        # Assuming there are no other antibodies in the database, this
        # specifies that the Antibody created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Antibody.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => antibody.to_param, :antibody => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested antibody as @antibody" do
        antibody = Antibody.create! valid_attributes
        put :update, {:id => antibody.to_param, :antibody => valid_attributes}, valid_session
        assigns(:antibody).should eq(antibody)
      end

      it "redirects to the antibody" do
        antibody = Antibody.create! valid_attributes
        put :update, {:id => antibody.to_param, :antibody => valid_attributes}, valid_session
        response.should redirect_to(antibody)
      end
    end

    describe "with invalid params" do
      it "assigns the antibody as @antibody" do
        antibody = Antibody.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Antibody.any_instance.stub(:save).and_return(false)
        put :update, {:id => antibody.to_param, :antibody => {}}, valid_session
        assigns(:antibody).should eq(antibody)
      end

      it "re-renders the 'edit' template" do
        antibody = Antibody.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Antibody.any_instance.stub(:save).and_return(false)
        put :update, {:id => antibody.to_param, :antibody => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested antibody" do
      antibody = Antibody.create! valid_attributes
      expect {
        delete :destroy, {:id => antibody.to_param}, valid_session
      }.to change(Antibody, :count).by(-1)
    end

    it "redirects to the antibodies list" do
      antibody = Antibody.create! valid_attributes
      delete :destroy, {:id => antibody.to_param}, valid_session
      response.should redirect_to(antibodies_url)
    end
  end

end
