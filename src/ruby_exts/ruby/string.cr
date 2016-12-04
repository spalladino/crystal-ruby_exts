class String
  def to_ruby
    LibRuby.rb_str_new_cstr(self)
  end

  def self.from_ruby(str : LibRuby::VALUE)
    Ruby::Value.new(str).to_s
  end
end
