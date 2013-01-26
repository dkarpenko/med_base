
class MedTestsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :prepare_dictionary_data, only: [:edit , :new]

  # GET /med_tests
  # GET /med_tests.json
  def index
    @med_tests = MedTest.all.desc(:created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @med_tests }
    end
  end

  # GET /med_tests/1
  # GET /med_tests/1.json
  def show
    @med_test = MedTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @med_test }
    end
  end

  # GET /med_tests/new
  # GET /med_tests/new.json
  def new
    @med_test = MedTest.new
    @med_test.test_date = Date.today
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @med_test }
    end
  end

  # GET /med_tests/1/edit
  def edit
    @med_test = MedTest.find(params[:id])
  end

  # POST /med_tests
  # POST /med_tests.json
  def create
    @med_test = MedTest.new(params[:med_test])

    respond_to do |format|
      if @med_test.save
        if(params[:default_antibodies])
          params[:default_antibodies].split(",").each do |antibody_name|
            @med_test.antibodies.create!({name: antibody_name})
          end
        end

        format.html { redirect_to edit_med_test_path(@med_test), notice: 'Med test was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /med_tests/1
  # PUT /med_tests/1.json
  def update
    @med_test = MedTest.find(params[:id])

    respond_to do |format|
      if @med_test.update_attributes(params[:med_test])
        format.html { redirect_to new_med_test_path, notice: 'Med test was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /med_tests/1
  # DELETE /med_tests/1.json
  def destroy
    @med_test = MedTest.find(params[:id])
    @med_test.destroy

    respond_to do |format|
      format.html { redirect_to med_tests_url }
    end
  end

  def prepare_dictionary_data
    # TODO Cache this values
      latest_med_tests = MedTest.limit(500)

      @doctors_names = latest_med_tests.collect{|t| t.doctor_client }.uniq.compact
      @test_purposes = latest_med_tests.collect{|t| t.test_purpose }.uniq.compact
      @antibody_names = latest_med_tests.collect{|t| t.antibodies }.flatten().collect{|a| a.name }.uniq.compact

  end
end
