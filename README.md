# Backcountry Bookings-BE

<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Activity][commit-activity-shield]][commit-activity-url]
[![Commit][last-commit-shield]][last-commit-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Code-Size][code-size-shield]][code-size-url]<br>

[![Watchers][watchers-shield]][watchers-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/TrailsNBrews/trails_n_brews_BE">
    <img src="app/assets/images/trails_n_brew_logo.png" alt="Logo" width="125" height="125">
  </a>
  <h3 align="center">Trails N Brews, BE</h3>

  <p align="center">
    A guide to lead hikers to "watering holes"
    <br />
    <a href="https://github.com/TrailsNBrews/Trails-N-Brews_FE/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/TrailsNBrews/Trails-N-Brews_FE/">View Demo</a>
    ·
    <a href="https://github.com/TrailsNBrews/Trails-N-Brews_FE/issues">Report Bug</a>
    ·
    <a href="https://github.com/TrailsNBrews/Trails-N-Brews_FE/issues">Request Feature</a>
  </p>
</div>

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

<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

Trails N' Brews (TnB) is a web app seeking to answer one of life's greatest needs for the Colorado hiker. Whether it be a 1 mile trail along the front range or an expedition to the summit of one this great state's many 14ers all hikers want to know where the nearest brewery is to celebrate and wind down from their achievement. TnB is designed with service oriented architecture.

Trails N' Brews - BE is the back end portion and is in charge of setting the necessary endpoints and services needed by the [FE half](https://github.com/TrailsNBrews/Trails-N-Brews_FE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Learning Goals
Utilize an Agile project management process to hone skill and comfort with building a back end under a service oriented architecture. This will be achieved by consuming the [Open Brewery DB's API](https://www.openbrewerydb.org/) and the [Colorado Trail Explorer (COTREX) data](https://data.colorado.gov/Recreation/Colorado-Trail-Explorer-COTREX-/tsn8-y22x) and exposing them as API endpoints for our front end to call upon. Developers will build experience using Github Projects and the issues features as a project management tool.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Rails]][Rails-url]

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

- Root directory: 'https://evening-caverns-30828.herokuapp.com/api/v1'
- Try it now: <br>
'https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=ber'
'https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries?name=brew'

- /users
  - GET user, /users/google_id?auth_token=token?auth_val=email
    - Receives the request for the user to log in, authenticates it, and returns the user info.
    - Headers:
      - CONTENT_TYPE => application/json
      - HTTP_AUTH_TOKEN is the google_token
      - HTTP_AUTH_VAL is the user email
      ![alt text](app/assets/images/readme_user_get.png)

  - POST user, /users/
    - JSON string in the body with user email, first_name, last_name, google_id, google_token
    - Headers: 
      - CONTENT_TYPE => application/json
      ![alt text](app/assets/images/readme_user_post.png)

- /search_breweries
  - Breweries by location
    - GET search_breweries?location="latitude,longitude"
      - Returns the nearest breweries to the location entered
      ![alt text](app/assets/images/readme_brewery_loc_get.png)

  - Breweries by name
    - GET search_breweries?name="name_fragment"&count="number_of_results"
      - Returns breweries in Colorado that closest match the name entered
      ![alt text](app/assets/images/readme_brewery_name_get.png)

  - Brewery by ID
    - GET search_breweries?id="brewery_id"
      - Returns the exact match for a brewery with that ID
      ![alt text](app/assets/images/readme_brewery_id_get.png)

- /search_trails
  - Trails by name
    - GET search_trails?search="name_fragment"&count="number_of_results"
      - Returns trails in Colorado that closest match the name entered
      ![alt text](app/assets/images/readme_trail_name_get.png)
  - Trail by ID
    - GET search_trails?id="trail_feature_id"
      - Returns the exact match for a trail with that Feature ID
      ![alt text](app/assets/images/readme_trail_id_get.png)

See the [open issues](https://github.com/TrailsNbrews/trails_n_brews_BE/issues) for a full list of proposed features (and known issues).

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

<div align="center">
  <img src="https://avatars.githubusercontent.com/u/46434166?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Christian McCabe<br>
    <a href="https://github.com/cemccabe">Github: cemccabe</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/105924761?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Colin Ciervo<br>
    <a href="https://github.com/Mrcolin99">Github: Mrcolin99</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/113863021?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Craig Weller<br>
    <a href="https://github.com/crgweller">Github: crgweller</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/111480866?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Kerynn Davis<br>
    <a href="https://github.com/Kerynn">Github: Kerynn</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/112499285?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Kyle Ledin<br>
    <a href="https://github.com/Kledin85">Github: Kledin85</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/113707169?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Rick Vermeil<br>
    <a href="https://github.com/RickV85">Github: RickV85</a>
  </p>
</div>
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/113728354?v=4" alt="Profile" width="80" height="80">
  <p align="center">
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

<!-- MARKDOWN LINKS & IMAGES -->
[commit-activity-shield]: https://img.shields.io/github/commit-activity/m/TrailsNBrews/trails_n_brews_BE?style=for-the-badge
[commit-activity-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/commits/main
[last-commit-shield]: https://img.shields.io/github/last-commit/TrailsNBrews/trails_n_brews_BE?style=for-the-badge
[last-commit-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/commits/main
[contributors-shield]: https://img.shields.io/github/contributors/TrailsNBrews/trails_n_brews_BE.svg?style=for-the-badge
[contributors-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TrailsNBrews/trails_n_brews_BE.svg?style=for-the-badge
[forks-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/network/members
[stars-shield]: https://img.shields.io/github/stars/TrailsNBrews/trails_n_brews_BE.svg?style=for-the-badge
[stars-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/stargazers
[issues-shield]: https://img.shields.io/github/issues/TrailsNBrews/trails_n_brews_BE.svg?style=for-the-badge
[issues-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/issues
[code-size-shield]: https://img.shields.io/github/languages/code-size/TrailsNBrews/trails_n_brews_BE?style=for-the-badge
[code-size-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/wiki
[watchers-shield]: https://img.shields.io/github/watchers/TrailsNBrews/trails_n_brews_BE?style=social
[watchers-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/network/members
[license-shield]: https://img.shields.io/github/license/TrailsNBrews/trails_n_brews_BE.svg?style=for-the-badge
[license-url]: https://github.com/TrailsNBrews/trails_n_brews_BE/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 
