module ItemsHelper

  def converting_to_jpy(unit_price)
    "#{unit_price.to_s(:delimited, delimiter: ',')}円"
  end

end
