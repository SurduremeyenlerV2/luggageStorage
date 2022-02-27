class NearByLocation {
  String title = "";
  String description = "";
  NearByLocation({required this.title, required this.description});
}

abstract class NearByLocations {
  static List<NearByLocation> nearByLocations = [
    NearByLocation(title: 'Mecidiyeköy', description: 'Karanfil sokak no:40'),
    NearByLocation(title: 'Beşiktaş', description: 'Gen sokak no:50'),
    NearByLocation(title: 'Etiler', description: 'Etiler sokağı no:28'),
    NearByLocation(
        title: 'Büyük Çekmece', description: 'Pirireis sokağı no : 7'),
  ];
}
