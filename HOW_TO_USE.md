# HOW TO USE THE GEM

* Add to your project from RubyGems:

```ruby
gem "geo-regions", "~> 1.0.0"
```

* You can install it directly from the GitHub packages also:

```ruby
source "https://rubygems.pkg.github.com/dcotecnologia" do
  gem "geo-regions", "~> 1.0.0"
end
```

* Or:

```ruby
gem "geo-regions", github: "dcotecnologia/geo-regions", tag: "v1.0.0"
```

By default, the gem uses the default locale of the i18n library. You can set a custom locale setting a custom configuration:

```ruby
GR.configure do |config|
  # The current locales available are ***de, en, es, fr, ja, pt ru and zh***.
  config.locale = :en
end
```

You're welcome to help us to improve the database and the translations as much you want!

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
        <GR::Country:0x00007f25991fe418
          @code="BR",
          @continent=
            <GR::Continent:0x00007f25991fe468 @code="SA", @name="\"SOUTH AMERICA\"">,
          @is_in_european_union=0,
          @name="Brazil">,
  @name="Sao Paulo">,
  @time_zone="America/Sao_Paulo">]
```

* Retrieve a list of countries:

```ruby
GR::Country.all
```

* Retrieve a list of countries by the name:

```ruby
GR:Country.find(name: "Braz")

# expected response
=>
[<GR::Country:0x00007fb6defdf9e8
  @code="BR",
  @continent=
    <GR::Continent:0x00007fb6defdfad8 @code="SA", @name="\"SOUTH AMERICA\"">,
  @is_in_european_union="0",
  @name="Brazil">]
```

* Retrieve a list of states:

```ruby
GR::State.all
```

* Retrieve a list of countries by the country tag and/or the name:

```ruby
GR::State.find(country: "BR", name: "Sao")

# expected response
[<GR::State:0x00007fb6def2fde0
  @code="SP",
  @country=
    <GR::Country:0x00007fb6def2fe58
      @code="BR",
      @continent=
        <GR::Continent:0x00007fb6def2fed0 @code="SA", @name="\"\"South America\"\"">,
      @is_in_european_union=0,
      @name="Brazil">,
  @name="\"\"Sao Paulo\"\"">]
```
