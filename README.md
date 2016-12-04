# ruby_exts

Write Ruby extensions in Crystal. Built from [this gist](https://gist.github.com/spalladino/10c829db3191a89a8ba73bb001d3c921), based upon [manastech/crystal_ruby](https://github.com/manastech/crystal_ruby).

Works with Crystal 0.20.0 and Ruby 2.3.1 on OSX El Capitan, though might work for other versions.

**Work in progress.**

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  ruby_exts:
    github: spalladino/ruby_exts
```

## Sample

Run an `irb` with the contents of `samples/sample.cr` with `make irb`:

```crystal
$ make irb
irb(main):001:0> coco = Coco.new("3")
=> #<Coco:0x007ff0b3039840>
irb(main):002:0> coco.size
=> 3
irb(main):003:0> get "https://raw.githubusercontent.com/manastech/crystal_ruby/master/README.md"
=> "crystal_ruby\n============\n\nWrite Ruby extensions in Crystal. This is just a [Proof of Concept](http://en.wikipedia.org/wiki/Proof_of_concept).\n"
```

## Usage

Coming soon.

## TODO

- [ ] Write usage documentation
- [ ] Define macros for writing Ruby classes
- [ ] Handle inheritance and Crystal generics when being exposing as Ruby classes
- [ ] Handle Crystal exceptions and rethrow them as Ruby exceptions
- [ ] Support multiple versions of Ruby
- [ ] Linux support
- [ ] Handle invocations from a non-main Ruby thread

## Contributing

1. Fork it ( https://github.com/spalladino/ruby_exts/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [spalladino](https://github.com/spalladino) Santiago Palladino - creator, maintainer
