class MedTestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_dictionary_data, only: [:edit, :new]

  def index
    @med_tests = MedTest.desc(:created_at).paginate(:page => params[:page], :per_page => 30)
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
    @med_test = MedTest.new(med_test_params)

    if @med_test.save
      unless  params[:default_antibodies].blank?
        params[:default_antibodies].split(',').each do |antibody_name|
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

    if @med_test.update_attributes(med_test_params)
      redirect_to edit_med_test_path(@med_test), notice: 'Med test was successfully updated.'
    else
      render action: "edit"
    end
  end


  def destroy
    @med_test = MedTest.find(params[:id])
    @med_test.destroy unless @med_test.nil?

    redirect_to med_tests_path(page: params[:page])

  end

  def prepare_dictionary_data
    # TODO Cache this values
    latest_med_tests = MedTest.limit(500)

    @doctors_names = latest_med_tests.collect { |t| t.doctor_client }.uniq.compact.sort
    @test_purposes = latest_med_tests.collect { |t| t.test_purpose }.uniq.compact.sort
    @antibody_names = latest_med_tests.collect { |t| t.antibodies }.flatten().collect { |a| a.name }.uniq.compact.sort

  end


  private

  def med_test_params
    params.require(:med_test).permit(:test_purpose, :body_ids, :antibodies, :patient_name, :conclusion,:description, :doctor_client, :tracking_number, :test_date)
  end

end
