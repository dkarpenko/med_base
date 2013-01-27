class MedTestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_dictionary_data, only: [:edit, :new]

  def index
    @med_tests = MedTest.all.desc(:created_at)
  end

  def show
    @med_test = MedTest.find(params[:id])
  end

  def new
    @med_test = MedTest.new
    @med_test.test_date = Date.today
  end


  def edit
    @med_test = MedTest.find(params[:id])
  end

  def create
    @med_test = MedTest.new(params[:med_test])

    if @med_test.save

      if (params[:default_antibodies].empty?)
        params[:default_antibodies].split(",").each do |antibody_name|
          @med_test.antibodies.create!({name: antibody_name})
        end
      end


      redirect_to params[:save_create] ? new_med_test_path :
                      edit_med_test_path(@med_test), notice: 'Med test was successfully created.'

    else
      render action: "new"
    end
  end


# PUT /med_tests/1
# PUT /med_tests/1.json
  def update
    @med_test = MedTest.find(params[:id])

    if @med_test.update_attributes(params[:med_test])
      redirect_to edit_med_test_path(@med_test), notice: 'Med test was successfully updated.'
    else
      render action: "edit"
    end
  end


  def destroy
    @med_test = MedTest.find(params[:id])
    @med_test.destroy

    redirect_to med_tests_url

  end

  def prepare_dictionary_data
    # TODO Cache this values
    latest_med_tests = MedTest.limit(500)

    @doctors_names = latest_med_tests.collect { |t| t.doctor_client }.uniq.compact
    @test_purposes = latest_med_tests.collect { |t| t.test_purpose }.uniq.compact
    @antibody_names = latest_med_tests.collect { |t| t.antibodies }.flatten().collect { |a| a.name }.uniq.compact

  end

end
