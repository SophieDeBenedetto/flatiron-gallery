class CohortsController < ApplicationController

  def create
    @cohort = CohortBuilder.new(cohort_params).build
    respond_to do |format|
      if @cohort.save
        format.js {render "success.js.erb"}
      else
        format.js {render json: @cohort}
      end
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :csv)
  end
end
