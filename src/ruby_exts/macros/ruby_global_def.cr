module RubyExts
  macro ruby_global_def(method_name, *args)
    RubyExts.global_def {{ method_name }}, {{ args.size }}, ->(obj : LibRuby::VALUE, {{ args.map { |arg| "__ruby_#{arg.var} : LibRuby::VALUE" }.join(", ").id }}) do
      begin
        {% for arg, index in args %}
           {{ arg.var }} = {{ arg.type }}.from_ruby({{ "__ruby_#{arg.var}".id }})
        {% end %}
        result = begin
          {{ yield }}
        rescue ex
          # TODO: Wrap exception as Ruby exception
          raise "Exception in {{ method_name.id }}: #{ex}"
        end
        return result.to_ruby
      rescue cast_ex
        # TODO: Wrap exception as Ruby exception
        raise "Exception casting arguments in {{ method_name.id }}: #{cast_ex}"
      end
    end
  end
end
