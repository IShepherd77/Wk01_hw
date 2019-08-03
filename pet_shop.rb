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

def increase_pets_sold(shop, number_of_pets)
  shop[:admin][:pets_sold] += number_of_pets
  #binding.pry
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  match_pets = []
  pet_array = shop[:pets]
  for pet in pet_array
    if pet[:breed] == breed
      match_pets.push(pet)
    end
  end
  return match_pets
end


def find_pet_by_name(shop, name)
  match_pet = nil
  pet_array = shop[:pets]
  for pet in pet_array
    if pet[:name] == name
      match_pet = pet
      break #to return first result or would return last if more Arthurs
    end
  end
  return match_pet
end

def remove_pet_by_name(shop, name)
  pet_array = shop[:pets]
  pet_to_delete = find_pet_by_name(shop, name)
  pet_array.delete(pet_to_delete)
end

def add_pet_to_stock(shop, new_pet)
  pet_array = shop[:pets]
  pet_array.push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  # customer_cash = customer[:cash]
  # pet_price = new_pet[:price]
  #return customer_cash >= pet_price
  return customer[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if (pet != nil) && customer_can_afford_pet(customer, pet)
    pet_array = shop[:pets]
    pet_array.delete(pet)
    add_or_remove_cash(shop, pet[:price])
    add_pet_to_customer(customer, pet)
    remove_customer_cash(customer, pet[:price])
    increase_pets_sold(shop, 1)
  end
end
