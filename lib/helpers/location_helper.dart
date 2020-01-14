const GOOGLE_API_KEY = "AIzaSyCXjxoNnxz6wsbUFaJMR3Nsng5uboY4MLA";

class LocationHelper {
  static String generatLocationImgUrlPreview(double lng, double lat) {
    return "https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lng,$lat&key=$GOOGLE_API_KEY";
  }
}
