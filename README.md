Here are some tips on how to use this API - through the terminal or Postman!

CREATING A CREATOR WITH FIRST_NAME AND LAST_NAME
  curl -i -X POST                                                              \
       -H 'Content-Type: application/json'                                     \
       -d '{ "creator": { "first_name": "John", "last_name": "Mayer" } }' \
       http://localhost:3000/api/v1/creators

_________________________________________________________________________________________

GETTING ALL CREATORS
  curl -s http://localhost:3000/api/v1/creators?sort='first_name'&sort_direction='asc'&limit='2'&offset='5' | jq

_________________________________________________________________________________________

GETTING A CREATOR BY THE ID
  curl -s http://localhost:3000/api/v1/creators/49 | jq

_________________________________________________________________________________________

CREATING A GIG WITH BRAND_NAME AND CREATOR
  curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -d '{ "gig": { "brand_name": "Brand Co" } }' \
     http://localhost:3000/api/v1/creators/6/gigs

_________________________________________________________________________________________

GETTING ALL GIGS
  curl -s "http://localhost:3000/api/v1/gigs?brand_name="Torp LLC"" | jq
_________________________________________________________________________________________

GETTING A GIG BY THE ID
  curl -s http://localhost:3000/api/v1/gigs/54 | jq

_________________________________________________________________________________________

UPDATING A GIG BY THE ID
  curl -i -X PATCH                                        \
     -H 'Content-Type: application/json'              \
     -d '{ "gig": { "state": "completed" } }'    \
     http://localhost:3000/api/v1/gigs/17
