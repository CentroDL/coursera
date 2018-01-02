class TableMerger
  attr_reader :tables, :merges, :parents, :largests

  def initialize(tables: tables, merges: merges, row_counts: row_counts)
    @tables     = tables
    @merges     = merges
    @parents    = []
    @largests   = row_counts
  end

  def process_requests
    m.times do |query|
      destination, source = process_input
      union( destination, source )
    end

    # output page count
  end

  def find(i)
    while i != parents[i]
      i = parents[i]
    end

    i
  end

  def make_set(i)
    parent[i] = i
    largest[i]   = 0
  end

  def union(destination, source)
    d = find(destination)
    s = find(source)

    if d == s
      return
    elsif d > s
    end
  end

  def process_input
    gets.split(' ').map(&:to_i)
  end

  def resolve_symlink
  end

end

n, m = process_input
rows = process_input


table_merger = TableMerger.new( tables: n, merges: m, row_counts: rows)
table_merger.process_requests



