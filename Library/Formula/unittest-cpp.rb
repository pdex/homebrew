require 'formula'

class UnittestCpp < Formula
  url 'http://downloads.sourceforge.net/project/unittest-cpp/UnitTest%2B%2B/1.4/unittest-cpp-1.4.zip'
  homepage 'http://unittest-cpp.sourceforge.net/'
  md5 'bd373a53403ed51ea1bbb60b1952d7e3'

  def patches
    # build a working library and actually install it somewhere
    DATA
  end
  def install
    system "make install PREFIX=#{prefix}"
  end

  def test
    system "TestUnitTest++"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 4f2ea9d..d2212d8 100644
--- a/Makefile
+++ b/Makefile
@@ -74,6 +74,7 @@
 $(lib): $(objects) 
 	@echo Creating $(lib) library...
 	@ar cr $(lib) $(objects)
+	@ranlib $(lib)
     
 $(test): $(lib) $(test_objects)
 	@echo Linking $(test)...
@@ -81,6 +82,14 @@
 	@echo Running unit tests...
 	@./$(test)
 
+install: $(test)
+	@echo Installing...
+	@install -d $(PREFIX)/include/Posix $(PREFIX)/bin $(PREFIX)/lib
+	@install src/*.h $(PREFIX)/include
+	@install src/Posix/*.h $(PREFIX)/include/Posix
+	@install $(test) $(PREFIX)/bin
+	@install $(lib) $(PREFIX)/lib
+
 clean:
 	-@$(RM) $(objects) $(test_objects) $(dependencies) $(test_dependencies) $(test) $(lib) 2> /dev/null
 
