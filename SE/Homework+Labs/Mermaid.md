```mermaid
classDiagram
  class Entity {
    -id: int
    +getId(): int
    +setId(int): void
  }
  class Coordinate {
	-lon: double
    -lat: double
    +getLatitude(): double
    +setLatitude(double): void
    +getLongitude(): double
    +setLongitude(double): void
    +toString(): String
  }
  class Line {
    -name: String
    -color: String
    -circular: boolean 
    -stops: List< Stop > 
    +getName(): String
    +setName(String): void
    +getColor(): String
    +setColor(String): void
    +isCircular(): boolean
    +setCircular(boolean): void
    +getStops(): List< Stop > 
    +void setStops(List<Stop> stops)
    +toString(): String
  }
  class Station {
    -name: String
    -location: Coordinate
    -stops: List< Stop >
    +getName(): String
    +setName(String): void
    +getLocation(): Coordinate
    +setLocation(Coordinate): void
    +getStops(): List< Stop >
    +setStops(List< Stop >): void
    +toString(): String
  }
  class Stop {
    -location: Coordinate
    -station: Station
    -line: Line
    +getLocation(): Coordinate
    +setLocation(Coordinate): void
    +getStation(): Station
    +setStation(Station): void
    +getLine(): Line
    +setLine(Line): void
    +toString(): String
  }
  class ModelData {
    +lines: List< Line >
    +stations: List< Station >
  }
  class Navigation {
    +RoutePreference: enum
    +findPath(ModelData, Station, Station, RoutePreference, Set< Line >): List< Stop >
  }
	  
  Station "1" --o "*" Stop
  Line "1" --o "2..*" Stop
  Station "1"--o "1" Coordinate 
  Stop "1" --o "1" Coordinate
  Station --|> Entity
  Line --|> Entity
  ModelData  "1" --o "*" Station
  ModelData  "1" --o "*" Line
  Navigation -- ModelData : uses
  Navigation -- Station : uses
  Navigation -- Line : uses
  Navigation -- Stop : uses
```
