class Bracket
  BRACKETS = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  def self.balanced(str)
    openers = []

    str.chars.each_with_index do |c, i|
      if BRACKETS.keys.include?(c)
        openers << { char: c, id: i }
      elsif BRACKETS.values.include?(c)
        opener = openers.pop[:char] unless openers.empty?

        if BRACKETS[opener] == c
          next
        else
          return i + 1
        end
      end
    end

    openers.empty? ? 'Success' : openers.first[:id]+1
  end
end

input = $stdin.read
puts Bracket.balanced(input)
