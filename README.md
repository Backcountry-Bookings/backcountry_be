# Backcountry Bookings-BE

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="left">
  <a href="https://github.com/Backcountry-Bookings/backcountry_be">
    <div align="center">
      <img src="https://raw.githubusercontent.com/Backcountry-Bookings/backcountry_fe/main/src/Assets/backcountryLogo.png" alt="Logo" width="200" height="200">
    </div>
  </a>
  <h3 align="left">Backcountry Bookings, BE</h3>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#learning-goals">Learning Goals</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#api information">API Information</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#developers">Developers</a></li>
    <li><a href="#project-managers-instructors">Project Managers-Instructors</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ul>
</details>
<br>

<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

Backcountry Bookings is your go-to campsite tracking tool that enables users to organize their future and past camping trips by creating a favorites list of all their outdoor vacations. Users will be able to search for campsites available within National Parks, by their preferred state, or by the campsite name. A user will be able to select a particular campsite to view more details including links to book their camping trip or view the directions from their current location. After a user has had a chance to enjoy their campsite visit, they will be able to leave detailed reviews on the campsite with the ability to specify the specific camp reservation site. Users will also be able to upload their own image to their campsite review.

Backcountry Bookings - BE is the back end portion and is in charge of setting the necessary endpoints and services needed by the [FE half](https://github.com/Backcountry-Bookings/backcountry_fe).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Learning Goals
Utilize an Agile project management process to hone skill and comfort with building a back end under a service oriented architecture. This will be achieved by consuming the [National Park Service API](https://www.nps.gov/subjects/developer/index.htm) and exposing them as API endpoints for our front end to call upon. Developers will build experience using Github Projects and the issues features as a project management tool. This final capstone project also provides the opportunity to explore and implement a stretch technology, AWS s3 Image Storage.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* Ruby on Rails

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* Ruby 2.7.4
* Rails 5.2.8

### API Information
This project comsumes external APIs that require API Keys. The Figaro gem was used to create a hidden .yml file to save the env files (you can use any gem to accomplish this). The gem is already listed in Gemfile but you need to follow the additional steps listed [here](https://github.com/laserlemon/figaro#:~:text=Figaro%20installation%20is%20easy%3A). Start at bundle exec figaro install

The variable names of your api keys must follow this pattern:

[National Park Service API](https://www.nps.gov/subjects/developer/api-documentation.htm)
* NPS_API_KEY: YOUR NPS API KEY

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com:Backcountry-Bookings/backcountry_be.git
   ```
2. Install gems
   ```sh
   bundle install
   ```
3. Setup db
   ```js
   rails db:{create,migrate}
   ```
4. Run RSpec tests
    ```sh
    bundle exec rspec
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

### Endpoints

- Root directory: 'https://backcountry-bookings-be.herokuapp.com/api/v1'
- Try it now: <br>
'https://backcountry-bookings-be.herokuapp.com/api/v1/campsites?park_name=yosemite'

- /campsites
  - GET campsite, /campsites/<campsite_id>
    - Returns details of a single campsite by the campsite id.

  ```
  {
    "data": {
        "id": "3CCB0AF7-A364-4490-A788-EE00700BD108",
        "type": "campsite",
        "attributes": {
              "name": "Antelope Point RV Park",
              "lat": "36.956030575674106",
              "long": "-111.43123626708984",
              "booking_link": "https://www.roverpass.com/c/antelope-point-rv-park-page-az/booking/?slug=antelope-point-rv-park-page-az",
              "description": "This is an RV site only. 104 full hook-up spaces, 15 pull-through spaces. Maximum Length - 70ft.",
              "images": [
                      {
                        "credit": "Antelope Point Marina",
                        "crops": [],
                        "title": "Antelope Point RV park",
                        "altText": "Aerial view of recreational vehicle campground",
                        "caption": "Antelope Point RV Park",
                        "url": "https://www.nps.gov/common/uploads/structured_data/7E3733CB-C900-8B13-A24B7886C66C5D66.png"
                      }
              ],
              "cost": [],
              "number_of_reservation_sites": "104",
              "reservation_info": "Antelope Point Marina's RV park takes reservations using a third party site.",
              "toilets": [
                        "Flush Toilets - year round"
              ],
              "showers": [
                        "None"
              ],
              "cell_coverage": "Yes - year round",
              "laundry": "No",
              "dump_station": "Yes - year round",
              "camp_store": "Yes - seasonal",
              "potable_water": [
                            "Yes - year round"
              ],
              "ice_available": "Yes - year round",
              "firewood_available": "No",
              "wheelchair_access": "",
              "weather_info": "The weather in Glen Canyon National Recreation Area is usually typical for the high deserts.",
              "park_name": null
          }
    }
  }
  ```

- Search for campsites (3 search options available)
  - /campsites?park_name=national park name
    - Campsites by park name (ex. Yosemite)
      - GET campsites?park_name="yosemite"
        - Returns the campsites available within the national park searched.

  - /campsites?name=campsite name
    - Campsites by the campsite name
      - GET campsites?name="aspenglen"
        - Returns the campsite by the name searched.

  - /campsites?state_code=state code
    - Campsites by state code (ex: OR, Oregon)
      - GET campsites?state_code="OR"
        - Returns the campsites available within the state code searched.

- Example Campsite Search Endpoint (GET '/api/v1/campsites?park_name=yosemite'):

  ```
  {
    "data": [
          {
            "id": "58B9591C-4723-4049-B26C-D30C07A6FAD6",
            "type": "campsite_search",
            "attributes": {
                    "name": "Bridalveil Creek Campground",
                    "description": "The Bridalveil Creek Campground is located along the Glacier Point Road near Bridalveil Creek",
                    "images": [
                          {
                            "credit": "NPS Photo",
                            "crops": [],
                            "title": "Bridalveil Campground",
                            "altText": "A wood sign at the entrance to a campground reads, Bridalveil Campground.",
                            "caption": "The entrance to Bridalveil Campground",
                            "url": "https://www.nps.gov/common/uploads/structured_data/F2FB2779-A1A5-985F-2488256AA422403C.jpg"
                          }
                    ],
                    "park_name": "YOSEMITE",
                    "state_code": null,
                    "cost": [
                          {
                            "cost": "36.00",
                            "description": "Bridalveil Creek Campground Reservation Fee - Non-Group Site/night",
                            "title": "Bridalveil Creek Campground Reservation Fee - Non-Group Site"
                          },
                          {
                            "cost": "75.00",
                            "description": "Bridalveil Creek Campground Group Site Fee - Group Site/night",
                            "title": "Bridalveil Creek Campground Group Site Fee - Group Site"
                          },
                          {
                            "cost": "50.00",
                            "description": "Bridalveil Creek Campground Stock Site Fee - Stock Site/night",
                            "title": "Bridalveil Creek Campground Stock Site Fee - Stock Site"
                      }
                    ]
          }
      },
      {...}
    ]
  }
  ```

- /favorites
  - POST favorite, /favorites?user_id=1
    - Create a favorite campsite for a user
    - Headers:
      - CONTENT_TYPE => application/json
      - ACCEPT => application/json
    - Body: `{ campsite_id: campsite_id }`
    - Successfully created response:

  ```
   { "success": "Favorite added successfully" }
  ```

  - GET favorites, /favorites?user_id=1
    - Returns the favorite campsites for a user

  ```
    { 
      "data": [
            "id": "1",
            "type": "favorite",
            "attributes": {
                  "campsite_id": "309847037"
          },
          {...}
      ]
    }
  ```

  - DELETE favorite, /favorites/<favorite_id>
    - Deletes a favorite from a user

  ```
    { "success": "Favorite deleted successfully" }
  ```

- /reviews 
  - POST review, /reviews?user_id=1&campsite_id=845729457
  - Create a review for a campsite
  - Headers: 
    - CONTENT_TYPE => application/json
    - ACCEPT => application/json
  - Body: 
  ```
    { 
      name: 'John'
      description: 'Was great!', 
      rating: 4,
      site_name: 'A4',
      img_file: camp.jpeg
    }
  ```
  - Successfully created response:

  ```
    { "success": "Review saved" }
  ```

  - GET review, /reviews?campsite_id=845729457
    - Returns the reviews for a campsite

  ```
    { 
      "data": [
        {
          "id": "1",
          "type": "review",
          "attributes": {
                "name": "John",
                "description": "Was great!",
                "rating": 4,
                "site_name": "A4",
                "image_url": "https://backcountrybookings.s3.us-west-2.amazonaws.com"
          }
        },
        {...}
      ]
    }
  ```

  - DELETE review, /reviews/<review_id>
    - Deletes a campsite review

  ```
    { "success": "Review deleted successfully" }
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Developers

<div align="left">
  <img src="https://avatars.githubusercontent.com/u/46434166?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Christian McCabe<br>
    <a href="https://github.com/cemccabe">Github: cemccabe</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/105924761?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Colin Ciervo<br>
    <a href="https://github.com/Mrcolin99">Github: Mrcolin99</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/113863021?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Craig Weller<br>
    <a href="https://github.com/crgweller">Github: crgweller</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/111480866?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Kerynn Davis<br>
    <a href="https://github.com/Kerynn">Github: Kerynn</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/112499285?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Kyle Ledin<br>
    <a href="https://github.com/Kledin85">Github: Kledin85</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/113707169?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Rick Vermeil<br>
    <a href="https://github.com/RickV85">Github: RickV85</a>
  </p>
</div>
<div align="left">
  <img src="https://avatars.githubusercontent.com/u/113728354?v=4" alt="Profile" width="80" height="80">
  <p align="left">
    Ryan Baer<br>
    <a href="https://github.com/RyanBaer42">Github: RyanBaer42</a>
  </p>
</div>

Project Links: <br> 
[Organization Link](https://github.com/Backcountry-Bookings) <br>
[Backend Link](https://github.com/Backcountry-Bookings/backcountry_be) <br>
[Frontend Link](https://github.com/Backcountry-Bookings/backcountry_fe)

## Project Managers-Instructors

1. Cassandra Torske
2. Ty Keating

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [National Park Service](https://www.nps.gov/subjects/developer/index.htm)
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>