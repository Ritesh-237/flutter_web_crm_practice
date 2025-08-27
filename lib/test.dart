import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EasyLoading Demo Styles")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _LoaderPreview(
              icon: Icons.hourglass_top,
              color: Colors.blue,
              text: "Loading...",
            ),
            _LoaderPreview(
              icon: Icons.check_circle,
              color: Colors.green,
              text: "Success!",
            ),
            _LoaderPreview(
              icon: Icons.error,
              color: Colors.red,
              text: "Error!",
            ),
          ],
        ),
      ),
    );
  }
}

class _LoaderPreview extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _LoaderPreview({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
