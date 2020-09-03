### Tast description
```
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...
```
### How it works
 I use a hash as primary storage for user requests. Script reading file by each line, It helps save memory and processing each user request
 - Structure of Hash `{ 'some_url' => { '111.222.333.444' => count_visits } }

### install gems
`bundle install`

### Run App
`ruby parser.rb webserver.log`

### Run Spec
`rspec`

### Run Reek
`reek`

### Time Benchmark 
- real    0m0.591s
- user    0m0.297s
- sys     0m0.126s

### Impruvments
Create Parsers for other file structures
Create interface for parser. For example: `ruby parser.rb --all webserver.log` - it's means show all information
Create export result lists for another analytical sofware
