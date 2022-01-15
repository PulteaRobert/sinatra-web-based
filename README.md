# Mentor Pairing Site

Mentor pairing site, in which students from any university can find a mentor in the industry to ask for guidance.

## Installation

In an empty folder run the following commands:

```bash
git init
git clone https://git.shefcompsci.org.uk/com1001-2020-21/team19/project.git
```
Now that you have the project on your local disk you must have the following installed:

Installing Ruby: Instructions for any platform can be found here:
```
 https://www.ruby-lang.org/en/documentation/installation/
```
Installing all the dependencies
```
gem install bundle
bundle install
```

## Usage

To run the program you must be located in the folder that you cloned the project.
You would run it as
```
ruby app.rb
```
To visit the website, in your browser type the following address
```
localhost:4567
```
The following accounts can be used to login
```
admin admin
mentee1 mentee1
mentee2 mentee2
mentor1 mentor1
mentor2 mentor2
```

## Testing and corectness of the code

We have developed automated tests ranging from unit tests, integration tests to validation tests so we covered all the situations in which a user would interact with the site. To run these tests
```bash
//Make sure you are located in the main directory of the project
cd spec
rspec dbqueries_spec.rb
```

## Authors and acknowledgment

```
Robert Pultea
Jun Zhang (Troy)
Khanh L Tran 
Lingxi Zhang
Xiangyi Wo (Oscar)
Yuyao Zhou
```
