<a name="readme-top"></a>

<div id="header" align="center">
  <a href="https://github.com/Backcountry-Bookings/backcountry_be">
    <img src="https://raw.githubusercontent.com/Backcountry-Bookings/backcountry_fe/main/src/Assets/backcountryLogo.png" alt="logo" width="200" height="auto" />
  </a>
</div>

# <p align="center"> Backcountry Bookings - BE </p>


Backcountry Bookings - BE is the backend service for the [Backcountry Bookings](https://backcountrybookings.herokuapp.com) app, providing the necessary endpoints and services needed by the [frontend](https://github.com/Backcountry-Bookings/backcountry_fe) team.

## About Backcountry Bookings

Backcountry Bookings is your go-to campsite tracking tool that enables users to organize their future and past camping trips by creating a favorites list of all their outdoor vacations. Users will be able to search for campsites available within National Parks by their preferred state, or by the campsite name. A user will be able to select a particular campsite to view more details including links to book their site or view the directions from their current location. After a user has had a chance to enjoy their campsite visit, they will be able to leave detailed reviews on the campsite with the ability to specify the specific camp reservation site. Users will also be able to upload their own image to their campsite review.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

### Learning Goals
Utilize an Agile project management process to hone skills and comfort with building the backend of a web application under a service-oriented architecture. This will be achieved by consuming the [National Park Service API](https://www.nps.gov/subjects/developer/index.htm) and exposing it as API endpoints for the frontend to call. Developers will build experience using Github Projects and the issues features as a project management tool. This final capstone project also provides the opportunity to explore and implement [Amazon AWS S3](https://aws.amazon.com/s3/) as a stretch technology.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Getting Started

### Prerequisites

* Ruby 2.7.4
* Rails 5.2.8

### API Information

This project comsumes a [third-party API from the National Park Service (NPS)](https://www.nps.gov/subjects/developer/api-documentation.htm) that requires registering for a key. The `figaro` gem was used to create a git-ignored .yml file to store our ENV variables. This gem is already listed in Gemfile, but additional steps listed [here](https://github.com/laserlemon/figaro#:~:text=Figaro%20installation%20is%20easy%3A) must be completed - start with `bundle exec figaro install`

The NPS API key must be named as follows:
  * NPS_API_KEY: [NPS](https://www.nps.gov/subjects/developer/get-started.htm)

### Installation

1. Clone the repo
   ```shell
   git clone git@github.com:Backcountry-Bookings/backcountry_be.git
   ```
1. Install gems
   ```shell
   bundle install
   ```
1. Setup db
   ```shell
   rails db:{drop,create,migrate}
   ```
1. Run Rake task
   ```shell
   rails csv_load:campsites
   ```
1. Run RSpec test suite
    ```shell
    bundle exec rspec
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Usage

### RESTful Endpoints

<details close>

* Root directory
  * `https://backcountry-bookings-be.herokuapp.com/api/v1`

#### Get Campsite Details

```http
GET /campsites/<CAMPSITE ID>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": {
        "id": "3CCB0AF7-A364-4490-A788-EE00700BD108",
        "type": "campsite",
        "attributes": {
            "name": "Antelope Point RV Park",
            "lat": "36.956030575674106",
            "long": "-111.43123626708984",
            "booking_link": "https://www.roverpass.com/c/antelope-point-rv-park-page-az/booking/?slug=antelope-point-rv-park-page-az",
            "description": "While the Antelope Point RV park is not physically within the boundaries of Glen Canyon National Recreation Area, it is adjacent to the Antelope Point Marina, restaurant, gift shop. This is an RV site only. 104 full hook-up spaces, 15 pull-through spaces. Maximum Length - 70ft. 2 RV dump stations",
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
            "weather_info": "The weather in Glen Canyon National Recreation Area is usually typical for the high deserts. Summers are extremely hot with little, if any, shade. Winters are moderately cold with night time lows often below freezing. Spring weather is highly variable and unpredictable with extended periods of winds. Fall weather is usually nice and mild, a great time to beat the heat (and the crowds!).",
            "park_name": "GLEN CANYON"
        }
    }
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/campsites/3CCB0AF7-A364-4490-A788-EE00700BD108

</details>

---

#### Search for Campsites by State

```http
GET /campsites?state_code=<STATE CODE>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "7475825B-E844-4012-841B-0E29E05D4540",
            "type": "campsite_search",
            "attributes": {
                "name": "Aspenglen Campground",
                "description": "Aspenglen Campground is reservation only. Visit Recreation.gov. Aspenglen opens for the 2023 season on May 26. Timed Entry Permits are included with your camping reservation. For Aspenglen Campers, your reservation includes access to Bear Lake Road. Campers will be able to initially enter the park beginning at 1 p.m. on the first day of your camping reservation. If you plan to enter the park earlier in the day, you will have to enter the park outside of the times when Timed Entry Permits are in effect.",
                "images": [
                    {
                        "credit": "NPS Photo",
                        "crops": [],
                        "title": "Aspenglen Campground",
                        "altText": "Road through pines with tent sites",
                        "caption": "Aspenglen Campground is nestled in a pine forest near Fall River",
                        "url": "https://www.nps.gov/common/uploads/structured_data/3FAA6E89-1DD8-B71B-0B170E56BD4ED00D.jpg"
                    },
                    {...}
                ],
                "park_name": "ROCKY MOUNTAIN",
                "state_code": "CO",
                "cost": [
                    {
                        "cost": "30.00",
                        "description": "Per site per night",
                        "title": "Camping Fee"
                    }
                ]
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/campsites?state_code=CO

</details>

---

#### Search for Campsites by National Park

```http
GET /campsites?park_name=<PARK NAME>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "B30A5B7D-0343-4E47-97E3-CBBAC4700D6B",
            "type": "campsite_search",
            "attributes": {
                "name": "Lava Point Campground",
                "description": "This campground is typically open May through September, as weather allows. Situated at 7890 feet above sea level, it is off the Kolob Terrace Road, 25 miles (45 minutes) north of the town of Virgin. It takes approximately one hour and 20 minutes to drive to the campground from the South Entrance of Zion Canyon. There are 6 primitive campsites available for reservations. The campground has pit toilets and trash cans, but no water. Vehicles longer than 19 feet are not permitted.",
                "images": [],
                "park_name": "ZION",
                "state_code": null,
                "cost": []
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/campsites?park_name=zion

</details>

---

#### Search for Campsites by Name

```http
GET /campsites?q=<CAMPSITE NAME>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "0158C072-F1F3-4904-98F2-9994BF2F116A",
            "type": "campsite_search",
            "attributes": {
                "name": "Rocky Knob Campground",
                "description": "Located in the Rocky Knob Recreation area, surrounded by 4,000 acres of forest, the campground is ideal for a traditional camping experience. The site offers easy access to the Rock Castle Gorge Trail, a 10.8-mile loop trail ranging in elevation from 1,700 to 3,572 feet. Rock Castle Gorge, a 1,500-foot ravine carved by the waters of Rock Castle Creek, is the focal point of this trail, offering hikers breathtaking scenery.",
                "images": [
                    {
                        "credit": "NPS photo",
                        "crops": [],
                        "title": "Sunrise at Rocky Knob Campground",
                        "altText": "Fog shrouds distant valleys, with mountains rising through the fog",
                        "caption": "Sunrise at Rocky Knob Campground",
                        "url": "https://www.nps.gov/common/uploads/structured_data/1B17F9D1-BC22-3DE0-51715449AF039DD0.jpg"
                    },
                    {...}
                ],
                "park_name": "BLUE RIDGE",
                "state_code": "VA",
                "cost": [
                    {
                        "cost": "20.00",
                        "description": "Per night charge for campsites is posted in each campground and available at www.nps.gov/blri. Holders of the Interagency Senior, Access, Golden Age, or Golden Access passes are entitled to a 50% discount on the base fee of the site physically occupied by the pass holder. Passes can be obtained at all campgrounds.",
                        "title": "Rocky Knob Campground Fee"
                    },
                    {
                        "cost": "35.00",
                        "description": "Campsite maximum 20 people, minimum 12 people. Pass holder discounts do not apply.",
                        "title": "Group Camping"
                    }
                ]
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/campsites?q=rocky

</details>

---

#### Search for Campsites Nearby User

```http
GET /campsites?by_dist=<LAT,LONG>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "F3D4A32A-B2CA-4E38-B049-C90164E4540A",
            "type": "campsite_search",
            "attributes": {
                "name": "Piñon Flats Campground",
                "description": "Piñon Flats is a National Park Service campground located one mile north of the Visitor Center, open April through October. All sites are by reservation on recreation.gov. Individual sites can be reserved up to 6 months in advance, and group sites can be reserved up to 1 year in advance.",
                "images": [
                    {
                        "credit": "NPS/Patrick Myers",
                        "crops": [],
                        "title": "Pinon Flats Campground",
                        "altText": "Pinon Flats Campground",
                        "caption": "Pinon Flats Campground",
                        "url": "https://www.nps.gov/common/uploads/structured_data/3C7D0ECA-1DD8-B71B-0B6F80EC51149C2F.jpg"
                    },
                    {...}
                ],
                "park_name": "GREAT SAND DUNES",
                "state_code": "CO",
                "cost": [
                    {
                        "cost": "20.00",
                        "description": "One campsite for one night, tent or RV, picnic table, fire ring and grate, nearby restroom with flush toilets, sinks, and dishwashing basin.",
                        "title": "Individual Site, Per Night"
                    }
                ]
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/campsites?by_dist=37.75,-105.51

</details>

---

#### Create a Favorite Campsite

```http
POST /favorites?user_id=1
```

<details close>
<summary> Details </summary>
<br>

Headers:<br>
```
{ "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
```

Body:<br>
```
{ campsite_id: CAMPSITE ID }
```

Response:
```json
{
    "success": "Favorite added successfully"
}
```

</details>

---

#### Get All User Favorites

```http
GET /favorites?user_id=<USER ID>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "72",
            "type": "favorite",
            "attributes": {
                "campsite_id": "7475825B-E844-4012-841B-0E29E05D4540"
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/favorites?user_id=1

</details>

---

#### Delete a Favorite Campsite

```http
DELETE /favorites/<FAVORITE ID>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "success": "Favorite deleted successfully"
}
```

</details>

---

#### Create a User Review

```http
POST /reviews?user_id=1&campsite_id=<CAMPSITE ID>
```

<details close>
<summary> Details </summary>
<br>

Headers:<br>
```
{ "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
```

Body:<br>
```
{ name: <NAME>, description: <DESCRIPTION>, site_name: <SITE NAME>, rating: <RATING>, img_file: <IMG_FILE> }
```

Response:
```json
{
    "success": "Review saved"
}
```

</details>

---

#### Get All User Reviews

```http
GET /reviews?campsite_id=<CAMPSITE ID>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "data": [
        {
            "id": "1",
            "type": "review",
            "attributes": {
                "image_url": "https://backcountrybookings.s3.us-west-2.amazonaws.com/JgEAZWZoAs5Va1i8dSui2BXf?response-content-disposition=inline%3B%20filename%3D%22IMG_7780.jpeg%22%3B%20filename%2A%3DUTF-8%27%27IMG_7780.jpeg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA2L6MFDWN522IDVNZ%2F20230406%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230406T063337Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=0c868390506a462d2084abd73cc6ac808f4a08de6e594ddd06a62cbff6fd6c23",
                "description": "Wonderful campsite!",
                "rating": 5.0,
                "site_name": "A-12",
                "campsite_id": "7475825B-E844-4012-841B-0E29E05D4540",
                "name": "Rick",
                "created_at": "2023-04-03T21:34:06.960Z"
            }
        },
        {...}
    ]
}
```

* Try it now:<br>
  * https://backcountry-bookings-be.herokuapp.com/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540

</details>

---

#### Delete a Review

```http
DELETE /reviews/<REVIEW ID>
```

<details close>
<summary> Details </summary>
<br>

Response:
```json
{
    "success": "Review deleted successfully"
}
```

</details>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

Project Links: <br> 
[Organization](https://github.com/Backcountry-Bookings) <br>
[Backend Repository](https://github.com/Backcountry-Bookings/backcountry_be) <br>
[Frontend Repository](https://github.com/Backcountry-Bookings/backcountry_fe)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Project Managers-Instructors

1. Cassandra Torske
1. Ty Keating

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [National Park Service](https://www.nps.gov/subjects/developer/index.htm)
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>