# Puppet Module for Linux Kernel crashdumps

This puppet modules helps enable crashdumps for the Linux kernel on various Linux distributions. As of now it is tested on Ubuntu and CentOS.

## Documentation

Enabling Linux Kernel Crashdumps:

```puppet
     include crashdump
```

## Patches and Testing

Contributions are highly welcomed, more so are those which contribute patches with tests. Or just more tests! We have [rspec-puppet](http://rspec-puppet.com/) and [rspec-system](https://github.com/puppetlabs/rspec-system-serverspec) tests. When [contributing patches](https://help.github.com/articles/using-pull-requests), please make sure that your patches pass tests:

```console
  igalic@levix ~/src/bw/puppet-crashdump (git)-[master] % rake spec
  ....................................

  Finished in 2.29 seconds
  36 examples, 0 failures
  igalic@levix ~/src/bw/puppet-crashdump (git)-[master] % rake acceptance

  ...loads of output...
  3 examples, 0 failures
  igalic@levix ~/src/bw/puppet-crashdump (git)-[master] %
```

## Release process

The version in metadata.json should be bumped according to [semver](http://semver.org/).

When cutting a new release, please

* make sure that all tests pass
* make sure that the documentation is up-to-date
* verify that all dependencies are correct, and up-to-date
* create a new, *signed* tag and a package, using rake
* and [upload the new package](http://forge.puppetlabs.com/brainsware/linux-crashdump/upload)

This module uses blacksmith for the release process to do that, it does all of that for us:

```console
    igalic@levix ~/src/bw/puppet-crashdump (git)-[master] % rake module:release
    Cleaning for module build
    Uploading to Puppet Forge brainsware/crashdump
    Bumping version from 0.1.2 to 0.1.3
    Pushing to remote git repo
    igalic@levix ~/src/bw/puppet-crashdump (git)-[master] %
```


License
-------

Apache Software License 2.0


Contact
-------

You can send us questions via mail [puppet@brainsware.org](puppet@brainsware.org), or reach us IRC: [igalic](https://github.com/igalic) hangs out in [#puppet](irc://freenode.org/#puppet)

Support
-------

Please log tickets and issues at our [Project's issue tracker](https://github.com/Brainsware/puppet-crashdump/issues)
