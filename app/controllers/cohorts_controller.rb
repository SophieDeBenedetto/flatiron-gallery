class CohortsController < ApplicationController
  def create
    binding.pry
    CohortBuilder.new(cohort_params).build
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :csv)
  end
end
