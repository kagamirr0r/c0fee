begin
  require 'hirb'
  require 'unicode/display_width/string_ext'
  require 'hirb-unicode'
rescue LoadError
  puts 'no hirb :('
end

if defined? Hirb
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

if defined?(RbReadline)
  readline_so = "readline.#{RbConfig::CONFIG['DLEXT']}"
  if $LOAD_PATH.detect { |d| File.exist?("#{d}/#{readline_so}") }
    class Object
      remove_const :Readline
    end
    require readline_so
  end
end

Pry.config.color = true

Pry.config.prompt = proc do |obj, _nest_level, _pry_|
  version = ''
  version << "\001\e[0;31m\002"
  version << RUBY_VERSION.to_s
  version << "\001\e[0m\002"

  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end
