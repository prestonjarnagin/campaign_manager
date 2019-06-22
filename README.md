# Campaign Manager

Campaign Manager is designed to allow users to create and manage SMS campaigns and the contacts that are assigned to them. There are many tools that allow users to schedule messages targeted toward mailing lists or groups, but few tools exist that allow pre-existing messages to be sent to individual users independent of the messages being sent of everyone else.

## Setup

Start with the steps that are common among Ruby on Rails projects...

* `$ git clone <URL OF THIS REPO>`
* `$ bundle`
* `$ rake db:{create, migrate}`
* `$ rails s` will start a local instance of the application at `http://localhost:3000`
* The test suite uses PhantomJS for headless JavaScript testing. In order to run tests, PhantomJS is required.
  * Install via brew `$ brew tap homebrew/cask && brew cask install phantomjs`
  * Run tests as normal with `$ bundle exec rspec`

## Usage

* To being, login or create a new account

### Campaigns

* Create a new campaign by specifying the text of individual messages as well as how much time should pass (in minutes) before sending the message.  
* Create additional messages with the "Add Message" button
* Messages can include `<name>` which will be replaced the the contacts actual name when a message is created for sending.  

### Contacts

* Create new contacts by specifying their phone number (U.S. only for now), their "internal name" (a name that will only be available to users of the application), and "external name" (the name that will be presented to the message receiver in place of `<name>`).

### Dashboard

* The dashboard can be accessed by clicking the application title in the navbar.
* The dashboard contains the button to trigger the processing of the current message queue.

### A note on automation

Previously, the project was configured to send messages automatically at a specified time. However, Heroku requires an upgraded plan to execute jobs in the background. As a result, the sending of any messages who's scheduled send time has passed needs to be triggered manually with a button on the dashboard page.

## API Endpoints

* API endpoints are nested under the URI `/api/v1`
  * `POST /users`
    * Creates a new user. Include in the body:
      * `email`
      * `password`
      * `first_name`
      * `last_name`
