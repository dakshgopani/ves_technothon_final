import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/driving_service.dart';
// import '../screens/drawer/driving_behaviour_analysis.dart';

class DistanceBottomSheet extends StatelessWidget {
  final Map<String, dynamic>? placeDetails;
  final VoidCallback? startLocationTracking;

  final VoidCallback? startDrivingAnalysis;

const DistanceBottomSheet({
  Key? key,
  this.placeDetails,
  this.startLocationTracking,
  this.startDrivingAnalysis,
}) : super(key: key);
  
  _makingPhoneCall(String phoneNumber) async {
    var url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Persistent Bottom Sheet
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6, // Fixed height
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: placeDetails == null
                ? _buildLoading()
                : _buildContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final DrivingBehaviorService _behaviorService = DrivingBehaviorService();

    int reviewCount = (placeDetails?['reviews'] as List?)?.length ?? 0;
    SizedBox(height: 16);
    return SingleChildScrollView(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            placeDetails?['name'] ?? 'Unknown Place',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              // Add functionality for similar places
            },
            child: const Text(
              "See similar places",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: List.generate(5, (index) {
                  if ((placeDetails?['rating'] ?? 0) >= index + 1) {
                    return const Icon(Icons.star,
                        color: Colors.amber, size: 18);
                  } else if ((placeDetails?['rating'] ?? 0) > index &&
                      (placeDetails?['rating'] ?? 0) < index + 1) {
                    return const Icon(Icons.star_half,
                        color: Colors.amber, size: 18);
                  } else {
                    return Icon(Icons.star_border,
                        color: Colors.grey.shade300, size: 18);
                  }
                }),
              ),
              const SizedBox(width: 8),
              Text(
                '${placeDetails?['rating']?.toStringAsFixed(1) ?? 'N/A'} ($reviewCount)',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            placeDetails?['formatted_address'] ?? 'No address available',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.directions),
                label: const Text('Directions'),
                onPressed: () {
                  // Add functionality for directions
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ElevatedButton.icon(
  icon: const Icon(Icons.navigation),
  label: const Text('Start'),
  onPressed: () {
    startLocationTracking?.call();   // Start location tracking
    _behaviorService.startTracking();
 _behaviorService.onCrashDetected = (bool crashed) {
      if (crashed) {
        // Handle crash detection here
        // For example, show an alert dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Potential Crash Detected'),
              content: Text('Are you okay? Emergency services can be contacted if needed.'),
              actions: [
                TextButton(
                  child: Text('I\'m Fine'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                ),
                TextButton(
                  child: Text('Get Help'),
                  onPressed: () {
                    // Add emergency contact functionality
                    Navigator.of(dialogContext).pop();
                    _makingPhoneCall('911'); // Or your local emergency number
                  },
                ),
              ],
            );
          },
        );
      }
    };
       // Start driving behavior analysis
    print('Driving behavior analysis started: ${_behaviorService.isCollecting}'); // Debug statement
    print('Crash Detection started: ${_behaviorService.onCrashDetected}'); // Debug statement

    Navigator.pop(context);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),


              if (placeDetails?['formatted_phone_number'] != null)
                ElevatedButton.icon(
                  icon: const Icon(Icons.call),
                  label: const Text('Call'),
                  onPressed: () {
                    _makingPhoneCall(placeDetails?['formatted_phone_number']);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}