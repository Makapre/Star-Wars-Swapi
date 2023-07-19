#  Star Wars Swapi

[swapi.dev](https://swapi.dev/documentation#root)

## Ideas

### MVP

- 4 Tabs
    - Dashboard
        - Cards w/ count of
            - People
            - Planets
            - Starships
            - Vehicles
            - Species
        - Movies as List or similiar
    - People
    - Planets
        - Comparisson w/ `Earth`, `Moon` oder `Sun`
        - 2 Circle in comparisson to above
        - Choice of comparisson object
    - Starships
        - Rating w/ stars
- Preferences
    - Wookie language `Shyriiwook`
        - `German` as placeholder
    - Show costs in `Galactial Credits` or `Euro`
    - As toolbar button
- Icon
- Manage pagination

### Optional

- Preferences
    - Color Theme
        - `Sith` or `Jedi`
        - Query after initial launch
- Images
- Sorting/ Filter
- Favourites
- Mini Quiz
- Detail Screen Movie
    - Opening Crawl á la movie
- LaunchScreen

## Techstack

### MVP

- SwiftUI
- Alamofire
- UserDefaults
- Localized Strings
- Swiftlint

### Optional
- XCTest
- Caching w/ CoreData or Realm
    - Caused by Rate limiting, but shouldn't be a big deal (10,000 requests/day each IP address)
