class PacketProcessor
  attr_accessor :buffer, :packet_count

  def initialize(buffer_size:, packet_count:)
    @buffer = Buffer.new(buffer_size)
    @packet_count = packet_count
  end

  def process(inputs)
    return if packet_count <= 0

    inputs.each do |input|
      parameters = input.split(' ')

      at = parameters[0]
      pt = parameters[1]

      packet = Packet.new(arrival_time: at, processing_time: pt)
      buffer.enqueue(packet)
    end
  end
end

class Buffer
  attr_reader :size, :queue

  def initialize(size)
    @size  = size
    @queue = Queue.new
  end

  def enqueue(val)
    if queue.size < size
      @queue << val
    end
  end
end

class Packet
  attr_reader :arrival_time, :processing_time

  def initialize(arrival_time:, processing_time:)
    @arrival_time = arrival_time
    @processing_time = processing_time
  end
end

inputs       = $stdin.read.split("\n")

settings     = inputs.shift.split(' ')
buffer_size  = settings[0]
packet_count = settings[1]

processor = PacketProcessor.new(buffer_size: buffer_size, packet_count: packet_count).process(inputs)