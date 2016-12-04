module Ruby
  struct Value
    ID_TO_S = LibRuby.rb_intern("to_s")

    @value : LibRuby::VALUE

    def initialize(@value : LibRuby::VALUE)
    end

    def to_unsafe
      @value
    end

    def to_s
      str = LibRuby.rb_funcall(self, ID_TO_S, 0)
      String.new(LibRuby.rb_string_value_cstr(pointerof(str)))
    end
  end
end
