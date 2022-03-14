# Log Parser

## Quickstart
1. Clone the repo 
```
git@github.com:ashutosh1/log_parser.git
```

2. Navigate to cloned floder
```
cd path/log_parser
```
3. Run bundle
```
bundle install
```
4. Run any following command to execute script
```
./parser.rb webserver.log 
ruby parser.rb webserver.log
ruby parser.rb -f webserver.log
```
5. For help
```
./parser.rb -h
ruby parser.rb -h
```
6. For Spec
```
rspec spec/
```
7. For rubocop
```
rubocop
rubocop --require rubocop-rspec
```
