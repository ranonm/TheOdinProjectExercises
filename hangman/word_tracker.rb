class WordTracker
  def initialize(incomplete_word)
    @tracker = incomplete_word
  end

  def include?(letter)
    @tracker.include?(letter)
  end

  def word_complete?
    @tracker.none? { |letter| letter.nil? }
  end

  def add(letter, positions)
    positions.each do |position|
      @tracker[position] = letter
    end
  end

  def to_s
    @tracker.map{ |letter| letter.nil? ? "_" : letter }.join(" ")
  end
end