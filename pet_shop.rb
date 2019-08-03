require ('pry')

def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, add_amount)
shop[:admin][:total_cash] += add_amount
end

def pets_sold(shop)
  #binding.pry
  return shop[:admin][:pets_sold]
end

#Alternative answer to above
# def pets_sold(shop)
#   sold = shop[:admin][:pets_sold]
#   return sold
# end
