require "crazy_pills/version"

module CrazyPills
  THINGS_TO_CRAZY = [
    Array,
    Exception,
    File,
    Float,
    Hash,
    Numeric,
    Object,
    String,
  ]
  
  ##
  # Seriously, what are you doing requiring this gem?
  # just don't
  warn <<-WARN
    Seriously? you required crazy_pills!!!
    Don't ...... Just don't
  WARN

  def self.aliased(*args)
    @aliased ||= []
    @aliased.concat(args) if args
    puts "Aliased #{args}" if ENV['DEBUG']
    @aliased
  end

  def self.explain
    made_nil.each do |nilled|
      puts <<-NIL
        Made #{nilled} just return nil
      NIL
    end

    aliased.each_slice(2) do |slice|
      puts <<-NIL
        Aliased #{slice.first} to #{slice.last}
      NIL
    end
  end

  def self.lets_get_crazy!(*classes)
    class_to_crazy = classes.flatten.sample

    method_to_crazy = class_to_crazy.instance_methods.sample

    if [true, false].sample
      self.made_nil("#{class_to_crazy}##{method_to_crazy}")

      class_to_crazy.class_eval do
        define_method(method_to_crazy) do
          nil
        end
      end
    else
      alias_to = class_to_crazy.instance_methods.sample
      self.aliased("#{class_to_crazy}##{method_to_crazy}", "#{class_to_crazy}##{alias_to}")

      class_to_crazy.class_eval do
        alias_method method_to_crazy, alias_to
      end
    end
  end

  def self.made_nil(name = nil)
    @made_nil ||= []
    @made_nil << name if name
    puts "Nil-ify #{name}" if ENV['DEBUG']
    @made_nil
  end

  (ENV['HOW_CRAZY'] || ENV['CRAZY'] || 1).to_i.times do
    lets_get_crazy!(*THINGS_TO_CRAZY)
  end
end
