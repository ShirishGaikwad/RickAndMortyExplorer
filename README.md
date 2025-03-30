# Rick and Morty Explorer App

This project is a Swift + SwiftUI application that allows users to explore characters, locations, and episodes from the Rick and Morty universe using the [Rick and Morty API](https://rickandmortyapi.com/).

## Features

- **Characters Tab**: Displays a list of characters with their images, names, and statuses.
- **Locations Tab**: Displays a list of locations with their names, types, and dimensions.
- **Episodes Tab**: Displays a list of episodes with their names, codes, and air dates.
- **Detail Views**: Navigate to detail views for more information about each character, location, and episode.

## Prerequisites

Before running the project, ensure the following tools are installed on your machine:

1. **Xcode 14 or newer**
2. **iOS Simulator** or a physical device running iOS 15 or newer

## Installation

1. Clone this repository:
   ```bash
   git clone <repository_url>
   ```

2. Navigate to the project directory:
   ```bash
   cd RickAndMortyExplorer
   ```

3. Open the project in Xcode:
   ```bash
   open RickAndMortyExplorer.xcodeproj
   ```

## Running the Application

1. In Xcode, select the desired **simulator** or a connected **physical device**.
2. Click the **Run** button (▶) in the top-left corner of Xcode.
3. The app will launch, and the main screen will display a TabView with three tabs: Characters, Locations, and Episodes.

## Code Structure

### Main Components

1. **MainView.swift**
   - Sets up a `TabView` with three tabs: Characters, Locations, and Episodes.

2. **CharactersView.swift**
   - Displays a grid of characters.
   - Fetches data from the API using `CharactersViewModel`.
   - Navigates to `CharacterDetailView` for detailed information.

3. **LocationsView.swift**
   - Displays a grid of locations.
   - Fetches data from the API using `LocationsViewModel`.
   - Navigates to `LocationDetailView` for detailed information.

4. **EpisodesView.swift**
   - Displays a grid of episodes.
   - Fetches data from the API using `EpisodesViewModel`.
   - Navigates to `EpisodeDetailView` for detailed information.

### Supporting Classes

1. **APIClient.swift**
   - Provides a generic function `fetchData` to fetch and decode data from the API.

2. **Models (APIResponse.swift)**
   - Defines data structures for `Character`, `Location`, and `Episode`.

3. **ViewModels**
   - `CharactersViewModel.swift`: Fetches and manages character data.
   - `LocationsViewModel.swift`: Fetches and manages location data.
   - `EpisodesViewModel.swift`: Fetches and manages episode data.

### Detail Views

1. **CharacterDetailView.swift**
   - Displays detailed information about a character using `CharacterDetailViewController`.

2. **LocationDetailView.swift**
   - Displays detailed information about a location using `LocationDetailViewController`.

3. **EpisodeDetailView.swift**
   - Displays detailed information about an episode using `EpisodeDetailViewController`.

### API Endpoints

- **Characters**: `https://rickandmortyapi.com/api/character`
- **Locations**: `https://rickandmortyapi.com/api/location`
- **Episodes**: `https://rickandmortyapi.com/api/episode`

## Notes

- **Dependencies**: The project does not use external libraries or package managers. All functionality is built-in using Swift and SwiftUI.
- **Error Handling**: The app gracefully handles API errors by showing an empty state if no data is available.

## Future Enhancements

1. Add pagination for better performance with large datasets.
2. Include search functionality for characters, locations, and episodes.
3. Implement custom error messages and loading indicators.

## License

This project is licensed under the MIT License. Feel free to use and modify the code as needed.

