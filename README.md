Require Pattern
===============
This library provides a simple extension to the Kernel module that allows files to be conveniantly `require`'d based on a glob pattern.

This library does NOT use load paths. Instead, it provides methods that load files either relative to the current working directory (`require_pattern`), or relative to the current file (`require_relative_pattern`).

Why?
----
At this point you may be wondering why would I not just do this:

```ruby
Dir.glob('**/*.rb') { |f| require f }
```

In some instances you will get away with that, but what happens when file _x_ must be required before file _y_? This is what this library intends to resolve. It will load files in a loop, keeping track of what succeeds, and fails with an exception. This process continues until either all files have been required, or until a loop iteration fails to load any files at all.

Usage
-----
Usage is relatively intuitive. Simply call either `require_pattern` or `require_relative_pattern` with one or more glob patterns, and all files matching those patterns will be required.

```ruby
require_pattern 'lib/**/*.rb', 'models/**/*.rb'
```

Any files that refuse to load will be reported to STDERR with backtrace information.


Tests
-----

```bash
mtest spec
```
