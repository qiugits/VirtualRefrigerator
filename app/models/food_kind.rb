class FoodKind < ApplicationRecord
  def short_name
    foodname = self.kindname
    if foodname =~ /（.*）/
      foodname.gsub!(/（.*）/, "")
    end
    if
      foodname =~ /＜.*＞/
      foodname.gsub!(/＜.*＞/, "")
    end
    if foodname =~ /［.*］/
      foodname.gsub!(/［.*］/, "")
    end
    if foodname =~ /^　.*/
      foodname.gsub!(/^　*/, "")
    end
    return foodname
  end
end
