require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# def topological_sort(vertices)


# end

def topological_sort(vertices)
  sorted = []
  top = Queue.new
  count = 0
  vertices.each do |vertex|
    top.enq(vertex) if vertex.in_edges.empty?
  end

  until top.empty?
    current = top.deq
    sorted << current
    current.out_edges.each do |edge|
      if edge.to_vertex.in_edges.length == 1
        top.enq(edge.to_vertex)
      end
      edge.to_vertex.in_edges.delete(edge)
    end
    count += 1
  end
  return [] unless count == vertices.length
  sorted
end
