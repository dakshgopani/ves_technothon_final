import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TripService {
  final DateTime? tripStartTime;
  final double? totalDistanceTraveled;
  final double? totalSpeed;
  final int? speedCount;
  final Map<String, dynamic>? startLocation;
  final Map<String, dynamic>? destination;
  final Duration? tripDuration;

  // Optional fields
  final double? drivingScore;
  final double? ecoScore;
  final double? safetyScore;
  final int? harshBrakingCount;
  final int? harshCorneringCount;

  TripService({
    this.tripStartTime,
    this.totalDistanceTraveled,
    this.totalSpeed,
    this.speedCount,
    this.startLocation,
    this.destination,
    this.tripDuration,
    this.drivingScore,
    this.ecoScore,
    this.safetyScore,
    this.harshBrakingCount,
    this.harshCorneringCount,
  });

  Future<String> saveTripDataToFirestore() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);
      CollectionReference tripsCollection = userRef.collection('trips');

      Map<String, dynamic> tripData = {
        if (tripStartTime != null) "startTime": tripStartTime,
        "endTime": DateTime.now(),
        if (totalDistanceTraveled != null) "totalDistance": totalDistanceTraveled!.toStringAsFixed(2),
        if (speedCount != null && totalSpeed != null && speedCount! > 0)
          "averageSpeed": (totalSpeed! / speedCount!).toStringAsFixed(2),
        if (tripDuration != null) "tripDuration": tripDuration!.inMinutes,
        if (startLocation != null) "startLocation": startLocation,
        if (destination != null) "destination": destination,
        "timestamp": FieldValue.serverTimestamp(),
        if (drivingScore != null) "drivingScore": drivingScore,
        if (ecoScore != null) "ecoScore": ecoScore,
        if (safetyScore != null) "safetyScore": safetyScore,
        if (harshBrakingCount != null) "harshBrakingCount": harshBrakingCount,
        if (harshCorneringCount != null) "harshCorneringCount": harshCorneringCount,
      };

      DocumentReference tripRef = await tripsCollection.add(tripData);
      print("✅ Trip data saved! Trip ID: ${tripRef.id}");
      return tripRef.id;
    } catch (e) {
      print("❌ Error saving trip data: $e");
      return '';
    }
  }
}
