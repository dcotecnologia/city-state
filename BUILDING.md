# BUILDING

The code source follows the pattern of a common gem. You can find it inside the lib folder.

This project is prepared to use Docker! Install the docker and (if you want) the docker-compose extension to easily build it!

```bash
docker-compose build
```

## Open a console with the gem installed

```bash
docker-compose run gem bash
```

## Check up the code quality with RuboCop

```bash
docker-compose run gem bundle exec rubocop -A
```

## Run the unit tests with RSpec

```bash
docker-compose run gem bundle exec rspec --profile
```

Please, if you want to edit/contribuct to the project, take a time to read
our [LICENSE.txt](LICENSE.txt) file.
