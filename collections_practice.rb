require "pry"

def begins_with_r(array)
  new_array = []
  array.each do |n|
    if n.start_with?("r")
      new_array.push(n)
    end 
  end 
  new_array.length == array.length
end 

def contain_a(array)
  new_array = []
  array.each do |n|
    if n.include?("a")
      new_array.push(n)
    end 
  end 
  new_array
end 

def first_wa(array)
  array.detect do |n|
    if n.class == String
      n.start_with? ("wa")
    end 
  end 
end

def remove_non_strings(array)
  new_array = []
  array.each do |n|
    if n.class == String
      new_array.push(n)
    end 
  end 
  new_array
end 

def count_elements(array)
  count = ""
  old_array = []
  final_array = []
  array.each do |i|
    old_array << i
  end 
  simplified_array = []
  while array.length > 0 
    simplified_array << array[0]
    array.delete(array[0])
  end 
  simplified_array.collect do |i|
    count = old_array.count i
    a = i.to_a
    b =  {:count => count}.to_a 
    a << b
    a.flatten!(2)
    h = Hash[*a]
    final_array << h
  end 
  final_array
end 

def merge_data(nest_one, nest_two)
  array = []
  nest_one.each do |hash|
    hash.each do |key, value|
      array << value 
    end
  end 
  nest_two.each do |hash|
    hash.each do |person, person_info|
      index = array.find_index(person)
      nest_two[0][person] = nest_two[0][person].merge(nest_one[index])
    end 
  end 
  nest_two = nest_two[0].values
end 

def find_cool (cool)
  counter = 0
  coolest = []
  cool.each do |hash|
    hash.each do |char, value|
      if char == :temperature
        if value == "cool"
          return cool[counter]
        end 
      end 
    end
    counter += 1
    coolest << cool[counter]
    return coolest
  end 
end 

def organize_schools (schools)
  array = []
  schools.each do |school, school_info|
    school_info.each do |location, location_val|
      array << {location_val => school}
    end 
  end 
  counter = 1
  while counter < array.length
    array[0].each do |location, school|
      if location == array[counter].keys[0]
        new_array = []
        new_array << array[0][location] 
        new_array << array[counter].values[0]
        new_array.flatten!
        array[0][location] = new_array
      elsif (array[0].keys.include? array[counter].keys[0]) == false
        new_array = []
        new_array << array[counter].values[0]
        array[counter] = {array[counter].keys[0] => new_array}
        array[0] = array[0].merge(array[counter])
      end 
    end 
    counter += 1
  end 
  array[0]
end 