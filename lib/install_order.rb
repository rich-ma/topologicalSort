# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'graph.rb'
require 'topological_sort'

def install_order(arr)
  vertices = []
  max = 0
  arr.each { |el| max = el[0] if el[0] > max }
  1.upto(max) { |n| vertices << Vertex.new(n) }
  arr.each do |el|
    from = vertices[el[1] - 1]
    to = vertices[el[0] - 1]
    Edge.new(from, to)
  end

  topological_sort(vertices).map {|el| el.value}

end
