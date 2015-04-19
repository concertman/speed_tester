## speed_tester

A small system that I use to measure my home internet connection speed.

#### Requirements

[speedtest-cli](https://github.com/sivel/speedtest-cli)
```
easy_install speedtest-cli
```
[sqlite3](http://www.sqlite.org) - if you don't have this just install via your package manager.

#### Install
Clone this repo

```ruby
bundle install
```

You will also need to change the `COMMAND` constant to point to the correct location of your speedtest-cli install if it doesn't end up in the same place. If you don't know where it is just run `which speedtest-cli` from the commandline and use that path.

#### Run

in cron

```shell
path/to/ruby path/to/speed_test.rb
```

#### Exporting results to CSV
I've included a script to export a CSV file that can be used in excel or google sheets.

#### Future
Some ideas to expand on.

- web app to view results
- possibly upload results to Google Sheets
- move to postgres db from sqlite
