class Dependencies

  def initialize
    @dependency= {}
  end

  def add(dependency_string)
    deps = get_internal dependency_string[0]
    if dependency_string.length > 1
      add dependency_string[1..-1]
      dependency_string[1..-1].each_char do |c|
        deps << c
      end
    end
  end

  def get_deps(name)
    deps = get_internal name
    deps.each do |dep|
      deps.concat get_internal dep
    end
    deps.sort!.uniq!
    deps.join
  end

  def get_internal(name)
    deps = @dependency[name]
    if (!deps)
      deps = []
      @dependency[name] = deps
    end
    deps
  end
end

