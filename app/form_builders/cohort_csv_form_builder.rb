class CohortCSVFormBuilder < ActionView::Helpers::FormBuilder

  def csv_upload_field
    "<input type='file' name='cohort[csv]' id='cohort_csv'>".html_safe
  end
end
