class CohortsController < ApplicationController

  def create
    @cohort = CohortBuilder.new(cohort_params).build
    respond_to do |format|
      if @cohort
        format.js {render "create.js.erb"}
      else
        format.js {render "fail.js.erb"}
      end
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :csv)
  end
end
