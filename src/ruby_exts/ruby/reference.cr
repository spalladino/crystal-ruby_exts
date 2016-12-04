class Reference
  def wrap(t = CrystalObject)
    LibRuby.rb_data_object_wrap(t, self.as(Void*), nil, ->crystal_object_free)
  end

  def self.unwrap(value : LibRuby::VALUE)
    value.as(LibRuby::RData*).value.data.as(self)
  end

  def wrap(value : LibRuby::VALUE)
    value.as(LibRuby::RData*).value.data = self.as(Void*)
  end
end
