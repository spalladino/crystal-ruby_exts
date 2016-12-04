require "../src/ruby_exts"
require "http/client"

# Sample method
RubyExts.global_def "get", 1, ->(obj : LibRuby::VALUE, rburl : LibRuby::VALUE) do
  begin
    url = String.from_ruby(rburl)
    HTTP::Client.get(url).body.to_ruby
  rescue ex
    # We should be wrapping the Crystal exception in a Ruby via `rb_raise`
    puts "Exception in get: #{ex}"
    "".to_ruby
  end
end

# Sample Crystal class to be wrapped as a Ruby class
class Coco
  @data = {"foo" => "1", "bar" => "2"}

  def initialize(x)
    @data["baz"] = x
  end

  def size
    @data.size
  end
end

Ruby::Class.new("Coco").tap do |c|
  c.allocate ->(c : LibRuby::VALUE) do
    # We send a nil reference to data_object_wrap, which we will overwite later once we initialize the object
    # Alternatively, we could call `Coco.allocate` here, wrap it, and call the `initialize` method on the Ruby initialize
    LibRuby.rb_data_object_wrap(c, nil, nil, ->crystal_object_free)
  end

  c.def "initialize", 1, ->(self : LibRuby::VALUE, x : LibRuby::VALUE) do
    # Do create an instance of Coco here, using the args provided, wrap it and return it
    # Alternatively, we could run `Coco.unwrap(self).initialize("lala")` if we had allocated it in the Ruby `allocate method`
    arg = String.from_ruby(x)
    coco = Coco.new(arg)
    RubyExts.add_root coco
    coco.wrap(self)
  end

  c.def "size", 0, ->(self : LibRuby::VALUE) do
    # Delegate a simple method to Coco, and wrap the return value as a Ruby value
    Coco.unwrap(self).size.to_ruby
  end
end

RubyExts.wrap_init("Init_sample")
