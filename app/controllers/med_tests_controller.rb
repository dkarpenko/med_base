class MedTestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_dictionary_data, only: [:edit, :new]
  before_filter :load_med_test, only: [:show, :edit, :update, :destroy]

  def index
    if params[:antibody_filter]
      @med_tests = MedTest.where('antibodies.name' => params[:antibody_filter]).desc(:created_at).paginate(:page => params[:page])
    else
      @med_tests = MedTest.desc(:created_at).paginate(:page => params[:page])
    end

  end

  def new
    @med_test = MedTest.new(test_date: Date.today)
  end

  def create
    @med_test = MedTest.new(med_test_params)

    if @med_test.save && save_antibodies(@med_test)

      redirect_to params[:save_create] ? new_med_test_path :
                      edit_med_test_path(@med_test), notice: 'Med test was successfully created.'
    else
      render action: :new
    end
  end


  def update
    if @med_test.update_attributes(med_test_params) && (save_antibodies(@med_test))
      redirect_to edit_med_test_path(@med_test), notice: 'Med test was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @med_test.destroy unless @med_test.nil?

    redirect_to med_tests_path(page: params[:page])

  end

  def prepare_dictionary_data
    # TODO Cache this values
    latest_med_tests = MedTest.limit(1000).sort(created_at: -1)

    @doctors_names = latest_med_tests.collect { |t| t.doctor_client }.uniq.compact.sort
    @test_purposes = latest_med_tests.collect { |t| t.test_purpose }.uniq.compact.sort
    @antibody_names = latest_med_tests.collect { |t| t.antibodies }.flatten().collect { |a| a.name }.uniq.compact.sort

  end


  private
  def load_med_test
    @med_test = MedTest.find(params[:id])
  end

  def save_antibodies(med_test)
    med_test.antibodies.delete_all unless med_test.antibodies.empty?

    unless params[:antibodies].blank?
      params[:antibodies].split(',').each do |antibody_name|
        med_test.antibodies.create!({name: antibody_name})
      end
    end
  end

  def med_test_params
    params.require(:med_test).permit(:test_purpose, :body_ids, :antibodies, :patient_name, :conclusion, :description, :doctor_client, :tracking_number, :test_date)
  end

end
