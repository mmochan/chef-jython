Description
===========
Cookbook for install jython on *nix systems

Requirements
============
Requires the opscode java cookbook. The dependency only is for `java` to be in your 
path so this is a very loose dependency.  The specific version of the java cookbook
should not matter.  You are obviously limited by jython's java requirments.

Attributes
==========

See `attributes/default.rb` for full list of attributes.

* `node["jython"]["version"]` - Version of jython to install. Currently supported
versions are `2.5.2`, `2.5.3`, and `2.7a2`.
* `node["jython"]["classpath"]` - After installation the initial package cache is 
generated, any jars here will be included in the cache. Defaults to `/usr/share/java/*`.
* `node["jython"]["package_cache_writable"]` - Whether or not the package cache 
should be world writable. This prevents seeing errors like 
`*sys-package-mgr*: can't write cache file for '/usr/lib/some-java-lib/foo.jar'`, 
but this has obvious security implications.

Recipes
=======

default
-------
Installs the selected jython version from a jar provided by the `Jython` project. This is the
recommended route as most distro packages are grossly out of date.

License and Author
==================

Author:: Mark Roddy (<markroddy a t gmail d-o-t com>)

Copyright:: 2012, Mark Roddy

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
