const GOOGLE_API_KEY = 'AIzaSyAOmSYGo-Y54DNxXpfZSMeIEA3P2IQb4dU';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude, int zoom}){
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=$zoom&size=600x300&maptype=roadmap &markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }
}