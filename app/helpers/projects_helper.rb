module ProjectsHelper

  def col_md(num)
    dimensions_map[num.to_s]["md"]
  end

  def col_sm(num)
    dimensions_map[num.to_s]["sm"]
  end

  def dimensions_map
    map = {
      "4" => {"md" => "3", "sm" => "6"},
      "3" => {"md" => "4", "sm" => "7"},
      "2" => {"md" => "6", "sm" => "9"}
     }
  end
end
