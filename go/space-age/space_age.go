package space

// Planet is our enum type for representings the 8 Planets
type Planet string

// Planet consts for each of the 8 Planets
const (
	Mercury Planet = "Mercury"
	Venus Planet = "Venus"
	Earth Planet = "Earth"
	Mars Planet = "Mars"
	Jupiter Planet = "Jupiter"
	Saturn Planet = "Saturn"
	Uranus Planet = "Uranus"
	Neptune Planet = "Neptune"
)


// Orbital Periods for each planet relative to Earth's years
const (
	MercuryPeriod float64 = 0.2408467
	VenusPeriod float64 = 0.61519726
	EarthPeriod float64 = 1.0
	MarsPeriod float64 = 1.8808158
	JupiterPeriod float64 = 11.862615
	SaturnPeriod float64 = 29.447498
	UranusPeriod float64 = 84.016846
	NeptunePeriod float64 = 164.79132
)

// SecondsInAnEarthYear is the number of seconds that it takes the earth to
// orbit the sun.
const SecondsInAnEarthYear float64 = 60 * 60 * 24 * 365.25

// Age returns the number of years that an individual has rotated our sun given
// the number of seconds that they've been alive and the Planet they lived on.
func Age(seconds float64, planet Planet) float64 {
	if seconds <= 0 {
		return 0
	}

	numberOfEarthYears := seconds / SecondsInAnEarthYear
	switch planet {
	case Mercury:
		return numberOfEarthYears / MercuryPeriod
	case Venus:
		return numberOfEarthYears / VenusPeriod
	case Earth:
		return numberOfEarthYears / EarthPeriod
	case Mars:
		return numberOfEarthYears / MarsPeriod
	case Jupiter:
		return numberOfEarthYears / JupiterPeriod
	case Saturn:
		return numberOfEarthYears / SaturnPeriod
	case Uranus:
		return numberOfEarthYears / UranusPeriod
	case Neptune:
		return numberOfEarthYears / NeptunePeriod
	default:
		return 0
	}
}
