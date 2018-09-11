class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_reader :
  def initialize(from_vertex, to_vertex, cost = 1)
    @from = from_vertex
    @to = to_vertex
    @weight = cost
  end

  def destroy!
    @to.in_edges.delete(self)
    @from.out_edges.delete(self)
    @to, @from = nil, nil
  end
end
