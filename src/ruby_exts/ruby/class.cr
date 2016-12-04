module Ruby
  struct Class
    ID_TO_S = LibRuby.rb_intern("to_s")

    def initialize(name)
      @class = LibRuby.rb_define_class(name, LibRuby.rb_cObject)
    end

    def allocate(f)
      LibRuby.rb_define_alloc_func(@class, f)
    end

    def def(name, args, f)
      LibRuby.rb_define_method(@class, name, f.pointer, args)
    end

    def to_unsafe
      @class
    end

    def to_ruby
      @class
    end
  end
end
