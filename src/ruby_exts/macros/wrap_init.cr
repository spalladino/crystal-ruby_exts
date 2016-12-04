module RubyExts
  macro wrap_init(init_name)
    fun init = {{ init_name }}(argc : Int32, argv : UInt8**)
      GC.init
      begin
        LibCrystalMain.__crystal_main(argc, argv)
      rescue ex
        ex.inspect_with_backtrace STDERR
      end
    end
  end
end
