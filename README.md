# README

These instructions will get you a copy of the project extensions up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

####Prerequisites:
* Install Ruby (Version 2.4.5)
* Install Rails (Version 5.1)

####Installing:
To run this application locally, clone this repo and follow the steps below:

1) Install gems:
```
$ bundle
```


2) Create, migrate, & seed database:
```
$ bundle && bundle update && rake db:{drop,create,migrate,seed}
```


3) Start your rails server:
```
$ rails s
```

4) Open browser and navigate to:
```
localhost:3000
```

##Running the RSpec Test Suite

RailsEngine has a full RSpec suite of feature and model tests for every piece of functionality in the app.

####Running the Full Test Suite:
From the root of directory, type the below command to run the full test suite:

$ rspec
Running only Feature Tests:
Type this command from the root of this directory.

```
$ rspec ./spec/requests/api/v1
```

####Running only Model Tests:
Type this command from the root of the directory.

```
$ rspec ./spec/models
```
