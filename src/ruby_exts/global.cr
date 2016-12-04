module RubyExts
  # Generic wrapper for sending Crystal objects to Ruby
  CrystalObject = Ruby::Class.new("CrystalObject")

  # Keep references to a set of objects sent to Ruby, to prevent them from being GC'ed
  Roots = Set(Void*).new

  def self.add_root(obj)
    Roots.add(obj.as(Void*))
  end

  def self.free_root(obj)
    Roots.delete obj
  end

  def self.global_def(name, args, f)
    LibRuby.rb_define_global_function(name, f.pointer, args)
  end
end

# When Ruby signals that an object can be GC'ed, removed it from Roots
fun crystal_object_free(obj : Void*)
  RubyExts.free_root(obj)
end
