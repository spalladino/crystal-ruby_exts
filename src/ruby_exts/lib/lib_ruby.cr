lib LibRuby
  type VALUE = Void*
  type ID = Void*
  type RUBY_DATA_FUNC = Void* -> Void

  $rb_cObject : VALUE

  struct RBasic
    flags : VALUE
    klass : VALUE
  end

  struct RData
    basic : RBasic
    mark : RUBY_DATA_FUNC
    free : RUBY_DATA_FUNC
    data : Void*
  end

  fun rb_define_global_function(name : UInt8*, f : Void*, args : Int32)
  fun rb_eval_string(str : UInt8*) : VALUE
  fun rb_str_new_cstr(str : UInt8*) : VALUE
  fun rb_define_class(name : UInt8*, parent : VALUE) : VALUE
  fun rb_define_method(clazz : VALUE, name : UInt8*, f : Void*, args : Int32)
  fun rb_any_to_s(v : VALUE) : VALUE
  fun rb_string_value_cstr(v : VALUE*) : UInt8*
  fun rb_intern(name : UInt8*) : ID
  fun rb_funcall(obj : VALUE, func : ID, args : Int32, ...) : VALUE
  fun rb_iv_set(obj : VALUE, name : UInt8*, value : VALUE) : VALUE
  fun rb_iv_get(obj : VALUE, name : UInt8*) : VALUE
  fun rb_data_object_wrap(klass : VALUE, ptr : Void*, mark : RUBY_DATA_FUNC, free : RUBY_DATA_FUNC) : VALUE
  fun rb_define_alloc_func(klass : VALUE, alloc : VALUE -> VALUE)
end
