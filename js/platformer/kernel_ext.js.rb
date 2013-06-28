module Kernel

  def log(*attrs)
    $global.console.log *attrs
  end

  # HACK
  # Opal currently does not fully implement the Method class
  # http://www.ruby-doc.org/core-2.0/Method.html
  def method(name)
    %x{
      var recv = #{self},
          meth = recv['$' + name],
          func = function() {
            return meth.apply(recv, __slice.call(arguments, 0));
          };

      if (!meth) {
        #{ raise NameError };
      }

      func.constructor = #{Method};
      func.$name = function() { return name };
      func.$receiver = function() { return recv };
      func['$=='] = function(other) { return this.$receiver()['$=='](other.$receiver()) && this.$name()['$=='](other.$name()) };
      return func;
    }
  end
end