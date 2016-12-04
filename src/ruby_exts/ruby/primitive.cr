struct Int
  def to_ruby
    Pointer(Void).new((self << 1) | 1).as(LibRuby::VALUE)
  end
end

struct Nil
  def to_ruby
    Pointer(Void).new(8_u64).as(LibRuby::VALUE)
  end
end

struct Bool
  def to_ruby
    Pointer(Void).new(self ? 20_u64 : 0_u64).as(LibRuby::VALUE)
  end
end
