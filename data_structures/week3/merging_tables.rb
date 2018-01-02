# require 'pry'
class TableMerger
  attr_reader :tables, :merges, :parents, :pages, :ranks
  attr_accessor :max_pages

  def initialize(tables:, merges:, row_counts:)
    @tables     = tables
    @merges     = merges
    @parents    = []
    @ranks      = []
    @pages      = row_counts # pages in each table or set
    @max_pages  = pages.max
  end

  def process_requests
    merges.times do |query|
      destination, source = process_input
      count = union( destination-1, source-1 )

      # binding.pry
      if count > self.max_pages
        self.max_pages = count
      end
      puts max_pages 
    end
  end

  # gives id of the base table
  # have to compress the path to save time
  def find(i)
    parents[i] = i if parents[i].nil?

    if i != parents[i]
      parents[i] = find(parents[i])
    end

    parents[i]
  end

  # def make_set(i)
  #   parent[i] = i
  #   pages[i]  = 0
  # end

  def union(destination, source)
    d = find(destination)
    s = find(source)

    ranks[d] = 0 if ranks[d].nil?
    ranks[s] = 0 if ranks[s].nil?

    if d == s
      return pages[d]
    end

    if ranks[d] > ranks[s]
      parents[s] = d
      pages[d] += pages[s]
      pages[s] = 0

      return pages[d]
    else
      # add source pages to destination and clear out source pages
      parents[d] = s
      pages[s] +=  pages[d]
      pages[d] = 0

      if ranks[s] == ranks[d]
        ranks[s] += 1
      end

      return pages[s]
    end
  end

  def process_input
    gets.split(' ').map(&:to_i)
  end
end

n, m = gets.split(' ').map(&:to_i)
rows = gets.split(' ').map(&:to_i)


table_merger = TableMerger.new( tables: n, merges: m, row_counts: rows)
table_merger.process_requests
