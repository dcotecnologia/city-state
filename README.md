# geo-regions Ruby Gem

[![Build](https://github.com/dcotecnologia/geo-regions-ruby/actions/workflows/build.yml/badge.svg)](https://github.com/dcotecnologia/geo-regions-ruby/actions/workflows/build.yml)
[![Gem Version](https://badge.fury.io/rb/geo-regions.svg)](https://badge.fury.io/rb/geo-regions)

A very simple ruby gem to get a list of states in a country. Also, you can get a
list of cities in a state, and a list of all countries of the world.

## Links

* How to Use It - [HOW_TO_USE.md](HOW_TO_USE.md).
* Code of Conduct - [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
* Contributing to the project - [CONTRIBUTING.md](CONTRIBUTING.md).
* Commit patterns - [COMITTING.md](COMITTING.md).
* Publishing the application - [PUBLISHING.md](PUBLISHING.md).
* Versioning releases - [VERSIONING.md](VERSIONING.md).
* Building the project - [BUILDING.md](BUILDING.md).
* Changelog - [CHANGELOG.md](CHANGELOG.md).

## How to use it?

* Add to your project:

```ruby
gem "geo-regions"
```

By default, the gem uses the default locale of the i18n library. You can set a custom locale setting a custom configuration:

```ruby
GR.configure do |config|
  config.locale = :en
end
```

* Retrieve a list of cities:

```ruby
GR::City.all
```

* Retrieve a list of cities by state code and/or country code and/or similar name:

```ruby
GR:City.find(state: "SP", country: "BR", name: "io Cl")

# expected response
=>
[<GR::City:0x00007f25991fe328
  @name="Rio Claro",
  @positions=GR::Geolite::CityPositions,
  @state=
    <GR::State:0x00007f25991fe3a0
      @code="SP",
      @country=
      #<GR::Country:0x00007f25991fe418
        @code="BR",
        @continent=
        #<GR::Continent:0x00007f25991fe468
          @code="SA",
          @name="\"SOUTH AMERICA\"">,
        @is_in_european_union=0,
        @name="Brazil">,
      @name="Sao Paulo">,
  @time_zone="America/Sao_Paulo">]
```

For more samples how to use the gem, check the [HOW_TO_USE.md](HOW_TO_USE.md) file.

If you want to edit the source code and/or contribuct to the gem, please, check the [HOW_TO_USE.md](HOW_TO_USE.md) file.

## Problems?

**Please do not directly email any committers with questions or problems.**  A
community is best served when discussions are held in public.

Searching the [issues](https://github.com/dcotecnologia/geo-regions/issues)
for your problem is also a good idea.

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented
or the bug hasn't been fixed yet;
* Check out the issue tracker to make sure someone already hasn't requested it
and/or contributed it;
* Fork the project;
* Start a feature/bugfix branch;
* Commit and push until you are happy with your contribution;
* Make sure to add tests for it. This is important so I don't break it in a
future version unintentionally.;
* Please try not to mess with the Rakefile, version, or history. If you want to
have your own version, or is otherwise necessary, that is fine, but please
isolate to its own commit so I can cherry-pick around it.

## License

Please see [LICENSE](LICENSE.txt) for licensing details.

## Authors

Danilo Carolino, [@danilogco](https://github.com/danilogco) / [@DCO Tecnologia](https://github.com/dcotecnologia)
