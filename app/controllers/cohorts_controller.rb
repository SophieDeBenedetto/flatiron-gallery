class CohortsController < ApplicationController

  def create
    CohortBuilder.new(cohort_params).build
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :csv)
  end
end
