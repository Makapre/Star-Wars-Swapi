#  Star Wars Swapi

[swapi.dev](https://swapi.dev/documentation#root)

## Ideas

### MVP

- ✅ 3 Tabs
    - ✅ People
    - ✅ Planets
        - ✅ Comparisson w/ `Earth`, `Moon` oder `Sun`
        - ✅ 2 Circle in comparisson to above
    - ✅ Starships
        - ✅ w/ Rating
        - ✅ costs
- ✅ Preferences
    - ✅ Show costs in `Galactial Credits` or `Euro`
        - ✅ Internet says 1 credit is roundabout 1 $, so 1 credit = 0,89 €
    - ✅ Choice of comparisson object
    - ✅ As toolbar button
- ✅ Icon

### Optional

- Preferences
    - Wookie language `Shyriiwook`
        - `German` as placeholder
- Manage pagination
- Additional Tab
    - Dashboard
        - Cards w/ count of
            - People
            - Planets
            - Starships
            - Vehicles
            - Species
        - Movies as List or similiar
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
- Localization

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
