/// GeoCoordinate is a typedef for a record type that represents geographical coordinates.\
/// lat (latitude), lng (longitude)
typedef GeoCoordinate = ({double lat, double lng});

/// Dimension is a typedef for a record type that represents the dimensions of a 3D object.
/// l (length), w (width), h (height)
typedef Dimension = ({double l, double w, double h});

/// This is useful for representing JSON objects where values can be of any type.
typedef JSON<T> = Map<String, T>;

/// Individual key-value pairs
typedef JSON_1<T> = ({String key, T value});
