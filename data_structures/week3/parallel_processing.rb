def assign_jobs(worker_count, job_count, times)
  workers = worker_count.times.map { |w| { thread: w, time: 0 } }
  queue = times.map.with_index do |job, i|
    w = workers.first.dup
    workers.first[:time] += job
    sift_down(0, workers)
    w
  end

  queue.each do |job|
    puts "#{job[:thread]} #{job[:time]}"
  end
end

# this needs to not only sift down if time is less but prioritize the indices of workers
def sift_down(i, arr)
  min = i

  left_id  = (2*i) + 1
  if left_id <= arr.size-1
    if arr[left_id][:time] < arr[min][:time]
      min = left_id
    elsif arr[left_id][:time] == arr[min][:time] && arr[left_id][:thread] < arr[min][:thread]
      min = left_id
    end
  end

  right_id = (2*i) + 2
  if right_id <= arr.size-1
    if arr[right_id][:time] < arr[min][:time]
      min = right_id
    elsif arr[right_id][:time] == arr[min][:time] && arr[right_id][:thread] < arr[min][:thread]
      min = right_id
    end
  end

  if i != min
    arr[i], arr[min] = arr[min], arr[i]

    sift_down(min, arr)
  end
end

# 1 <+ n <= 10^5, 1 <= m <= 10^5
workers, jobs = gets.split(" ").map(&:to_i)
# length: 0 -> 10^9
times         = gets.split(" ").map(&:to_i)

assign_jobs(workers, jobs, times)


