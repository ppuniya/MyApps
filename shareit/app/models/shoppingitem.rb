class Shoppingitem < ActiveRecord::Base
  belongs_to :list

  UNIT_TYPES = [["Kilograms", "kg"], ["Number of", "each"], ["Litres", "lt"], ["Grams", "g"], ["Millilitres", "ml"]]
end
