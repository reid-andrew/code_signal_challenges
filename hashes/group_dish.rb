def groupingDishes(dishes)
  used_in = Hash.new()
  result = []
  dishes.each do |dish|
    food = dish.shift
    dish.each do |ingredient|
      used_in[ingredient] = [] if !used_in[ingredient]
      used_in[ingredient] << food
    end
  end
  output = used_in.select { |key, val| val.size > 1 }
  output.sort.map { |key, val| result << [key, val.sort].flatten }
  result
end

dishes = [["Salad","Tomato","Cucumber","Salad","Sauce"],
 ["Pizza","Tomato","Sausage","Sauce","Dough"],
 ["Quesadilla","Chicken","Cheese","Sauce"],
 ["Sandwich","Salad","Bread","Tomato","Cheese"]]

groupingDishes(dishes)
