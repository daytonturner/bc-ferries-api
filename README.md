## 🛳 BC Ferries API - [bcferriesapi.ca](https://bcferriesapi.ca)

The only public API for retrieving current data on BC Ferries sailings. Used in my app [BC Ferry Times](https://apps.apple.com/ca/app/id1615899209), an iOS app to get the latest ferry schedule and sailing capacities.

## How It's Made

BC Ferries API is a Go api connected to a web scraper. The scraper is made with Goquerey. It runs every minute and saves the relevant, formatted data to a json file. When the api recieves a request, it checks the validity of the request, then returns the specified data.

## API Reference

This API uses the route codes used by BC Ferries, they are:

```
"TSA" -> Tsawwassen
"SWB" -> Swartz Bay
"SGI" -> Southern Gulf Islands
"DUK" -> Duke Point (Nanaimo)
"FUL" -> Fulford Harbour (Salt Spring Island)
"HSB" -> Horseshoe Bay
"NAN" -> Departure Bay (Nanaimo)
"LNG" -> Langford
"BOW" -> Bowen Island
```

The api runs on the format:

`https://www.bcferriesapi.ca/api/<departure-terminal>/<destination-terminal>`

You can be as specific as needed, the fewer arguments there are, the more data you will recieve.

For example, `https://www.bcferriesapi.ca/api/tsawwassen` will return all data for all sailings leaving from Tsawwassen.

A request to `https://www.bcferriesapi.ca/api/` will return a full schedule for all terminals.

Options for each are as follows:

### departure-terminal

```
"TSA"
"SWB"
"HSB"
"DUK"
"LNG"
"NAN"
"FUL"
"BOW"
```

### destination-terminal

Note: destination terminal must correspond with departure terminal, for example you can't put tsawwassen to langdale, it will return an error.

```
"TSA": [
    "SWB"
    "SGI"
    "DUK"
]
"SWB": [
    "TSA"
    "FUL"
    "SGI"
]
"HSB": [
    "NAN"
    "LNG"
    "BOW"
]
"DUK": [
    "TSA"
]
"LNG": [
    "HSB"
]
"NAN": [
    "HSB"
]
"FUL": [
    "SWB"
]
"BOW": [
    "HSB"
]
```

## Sample response

A sample response from `https://www.bcferriesapi.ca/api/` can be found in `sample_response.json`.

## Used By

Add your project here if it uses the BC Ferries API.

- [BC Ferry Times](https://apps.apple.com/ca/app/id1615899209): An iOS app to get the latest ferry schedule and sailing capacities.
- [MMM BC Ferries](https://github.com/stonecrown/MMM-BCFerries): A MagicMirror2 module that displays the current info for scheduled sailings of a specified BC Ferries route.
- [Cascadia Crossing](https://apps.apple.com/app/1643019956): An iOS app to get the latest border crossing times, ferry schedules, and sailing capacitites.
