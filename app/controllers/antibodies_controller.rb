class AntibodiesController < ApplicationController

  before_filter :load_med_test
  before_filter :load_antibody, only: [:edit, :update, :destroy]

  before_filter :prepate_antibody_names, only: [:edit, :new]


  def new
    @med_test = MedTest.find(params[:med_test_id])
    @antibody = @med_test.antibodies.build()

    render layout: false, action: :form
  end

  def edit
    render layout: false, action: :form
  end

  def create

    @med_test = MedTest.find(params[:med_test_id])
    @antibody = @med_test.antibodies.create!(antibody_params)
    redirect_to edit_med_test_url(@med_test), :notice => "Antibody added!"

  end

  # PUT /antibodies/1
  # PUT /antibodies/1.json
  def update

    @antibody.update_attributes(antibody_params)
    redirect_to edit_med_test_url(@med_test), :notice => "Antibody updated!"

  end

  def load_med_test
    @med_test = MedTest.find(params[:med_test_id])
  end

  def load_antibody

    @antibody = @med_test.antibodies.find(params[:id])
  end

  # DELETE /antibodies/1
  # DELETE /antibodies/1.json
  def destroy
    @antibody.destroy

    redirect_to edit_med_test_url(@med_test), :notice => "Antibody updated!"
  end


  def prepate_antibody_names
    # TODO Cache this values
    @antibody_names = MedTest.limit(200).collect { |t| t.antibodies }.flatten().collect { |a| a.name }.uniq.compact.sort
  end

  private
  def antibody_params
    params.require(:antibody).permit(:reaction_score_score, :reaction_score_percentage, :reaction_mark, :result, :description, :name)
  end

end
