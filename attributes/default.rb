
# Version of Jython to be installed
default["jython"]["version"] = "2.5.3"

# Whether or not the package cache should be world writable,
# If you see errors like:
# *sys-package-mgr*: processing new jar, '/usr/lib/some-java-lib/foo.jar'
# *sys-package-mgr*: can't write cache file for '/usr/lib/some-java-lib/foo.jar'
#
# This means that the package cache is not writable by this user, setting
# this attribute to true will make it world writable at the obvious
# security expense.
default["jython"]["package_cache_writable"] = false

# lib directory to install jython-X.Y.Z into
default["jython"]["install_root"] = "/usr/lib"

# where to drop user executable scripts
default["jython"]["bin_directory"] = "/usr/bin"

# Value to use for $CLASSPATH for importing packages
default["jython"]["classpath"] = "/usr/share/java/*"

# jars for various jython versions
default["jython"]["versions"]["2.5.2"] = {
  "remote_jar" => "http://downloads.sourceforge.net/project/jython/jython/2.5.2/jython_installer-2.5.2.jar",
  "jar_checksum" => "1b7168b961e31ddd89012a36cde611c340dadfd8b60b81c4248b026730ee2f29",
}
default["jython"]["versions"]["2.5.3"] = {
  "remote_jar" => "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/2.5.3/jython-installer-2.5.3.jar",
  "jar_checksum" => "05405966cdfa57abc8e705dd6aab92b8240097ce709fb916c8a0dbcaa491f99e"
}
default["jython"]["versions"]["2.7a2"] = {
  "remote_jar" => "http://downloads.sourceforge.net/project/jython/jython-dev/2.7.0a2/jython_installer-2.7a2.jar",
  "jar_checksum" => "b640c98652b050b5c66b256161d63dac1336a78cf37e240db3d8089466c11266",
}
