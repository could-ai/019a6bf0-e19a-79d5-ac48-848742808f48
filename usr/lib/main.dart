import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria Ilustracji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IllustrationGallery(),
    );
  }
}

class IllustrationGallery extends StatelessWidget {
  const IllustrationGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria Ilustracji'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return IllustrationCard(index: index);
        },
      ),
    );
  }
}

class IllustrationCard extends StatelessWidget {
  final int index;

  const IllustrationCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IllustrationDetail(index: index),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: CustomPaint(
                  painter: IllustrationPainter(index: index),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ilustracja ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getDescription(index),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription(int index) {
    final descriptions = [
      'Abstrakcja geometryczna',
      'Krajobraz górski',
      'Zachód słońca',
      'Las nocą',
      'Morska fala',
      'Gwiezdne niebo',
      'Kwiatowa łąka',
      'Miejski krajobraz',
    ];
    return descriptions[index % descriptions.length];
  }
}

class IllustrationDetail extends StatelessWidget {
  final int index;

  const IllustrationDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ilustracja ${index + 1}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomPaint(
                      painter: IllustrationPainter(index: index),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Ilustracja ${index + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _getDetailedDescription(index),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDetailedDescription(int index) {
    final descriptions = [
      'Nowoczesna kompozycja geometryczna z żywymi kolorami',
      'Malowniczy krajobraz górski z ośnieżonymi szczytami',
      'Piękny zachód słońca nad spokojnym oceanem',
      'Tajemniczy nocny las oświetlony przez księżyc',
      'Potężna morska fala z odcieniami błękitu',
      'Rozgwieżdżone niebo pełne gwiazd i galaktyk',
      'Kolorowa łąka pełna kwiatów i motyli',
      'Dynamiczny miejski krajobraz w nocy',
    ];
    return descriptions[index % descriptions.length];
  }
}

class IllustrationPainter extends CustomPainter {
  final int index;

  IllustrationPainter({required this.index});

  @override
  void paint(Canvas canvas, Size size) {
    switch (index % 8) {
      case 0:
        _drawGeometric(canvas, size);
        break;
      case 1:
        _drawMountains(canvas, size);
        break;
      case 2:
        _drawSunset(canvas, size);
        break;
      case 3:
        _drawNightForest(canvas, size);
        break;
      case 4:
        _drawOceanWave(canvas, size);
        break;
      case 5:
        _drawStarryNight(canvas, size);
        break;
      case 6:
        _drawFlowerMeadow(canvas, size);
        break;
      case 7:
        _drawCityscape(canvas, size);
        break;
    }
  }

  void _drawGeometric(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Tło
    paint.color = const Color(0xFFF5F5F5);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Koła
    paint.color = Colors.blue.withOpacity(0.7);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 60, paint);

    paint.color = Colors.orange.withOpacity(0.7);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.5), 80, paint);

    paint.color = Colors.purple.withOpacity(0.7);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.7), 50, paint);

    // Trójkąty
    paint.color = Colors.red.withOpacity(0.6);
    final path = Path()
      ..moveTo(size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width * 0.9, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.4)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawMountains(Canvas canvas, Size size) {
    // Niebo
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blue[200]!, Colors.blue[50]!],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Góry w tle
    final mountainPaint = Paint()..color = Colors.grey[600]!;
    final backMountain = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.3)
      ..lineTo(size.width * 0.6, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(backMountain, mountainPaint);

    // Góry na pierwszym planie
    mountainPaint.color = Colors.grey[800]!;
    final frontMountain = Path()
      ..moveTo(0, size.height * 0.7)
      ..lineTo(size.width * 0.5, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(frontMountain, mountainPaint);

    // Śnieg na szczytach
    final snowPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), 20, snowPaint);
  }

  void _drawSunset(Canvas canvas, Size size) {
    // Gradient nieba
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.purple[900]!,
          Colors.orange[700]!,
          Colors.orange[400]!,
          Colors.yellow[200]!,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Słońce
    final sunPaint = Paint()..color = Colors.orange[300]!;
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.65),
      size.width * 0.15,
      sunPaint,
    );

    // Morze
    final seaPaint = Paint()..color = Colors.blue[900]!.withOpacity(0.5);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4),
      seaPaint,
    );

    // Odbicie słońca
    final reflectionPaint = Paint()
      ..color = Colors.orange[200]!.withOpacity(0.3);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.4,
        size.height * 0.65,
        size.width * 0.2,
        size.height * 0.35,
      ),
      reflectionPaint,
    );
  }

  void _drawNightForest(Canvas canvas, Size size) {
    // Nocne niebo
    final skyPaint = Paint()..color = const Color(0xFF0A1828);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Księżyc
    final moonPaint = Paint()..color = Colors.grey[300]!;
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      30,
      moonPaint,
    );

    // Gwiazdy
    final starPaint = Paint()..color = Colors.white;
    for (int i = 0; i < 20; i++) {
      canvas.drawCircle(
        Offset(
          ((i * 47) % size.width.toInt()).toDouble(),
          ((i * 31) % (size.height * 0.5).toInt()).toDouble(),
        ),
        2,
        starPaint,
      );
    }

    // Drzewa
    final treePaint = Paint()..color = Colors.black;
    for (int i = 0; i < 5; i++) {
      final x = size.width * (0.1 + i * 0.2);
      final tree = Path()
        ..moveTo(x, size.height)
        ..lineTo(x - 30, size.height * 0.6)
        ..lineTo(x, size.height * 0.4)
        ..lineTo(x + 30, size.height * 0.6)
        ..close();
      canvas.drawPath(tree, treePaint);
    }
  }

  void _drawOceanWave(Canvas canvas, Size size) {
    // Tło oceanu
    final oceanPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blue[300]!, Colors.blue[700]!],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), oceanPaint);

    // Fale
    final wavePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (int i = 0; i < 5; i++) {
      final wave = Path()
        ..moveTo(0, size.height * (0.3 + i * 0.15));
      for (double x = 0; x < size.width; x += 20) {
        wave.quadraticBezierTo(
          x + 10,
          size.height * (0.3 + i * 0.15) - 10,
          x + 20,
          size.height * (0.3 + i * 0.15),
        );
      }
      canvas.drawPath(wave, wavePaint);
    }

    // Piana
    final foamPaint = Paint()..color = Colors.white.withOpacity(0.8);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.5), 15, foamPaint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.6), 20, foamPaint);
  }

  void _drawStarryNight(Canvas canvas, Size size) {
    // Nocne niebo z gradientem
    final skyPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [Colors.indigo[900]!, Colors.black],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Gwiazdy różnych rozmiarów
    final starPaint = Paint()..color = Colors.white;
    for (int i = 0; i < 50; i++) {
      final starSize = (i % 3 + 1).toDouble();
      canvas.drawCircle(
        Offset(
          ((i * 73) % size.width.toInt()).toDouble(),
          ((i * 47) % size.height.toInt()).toDouble(),
        ),
        starSize,
        starPaint,
      );
    }

    // Droga Mleczna
    final galaxyPaint = Paint()
      ..color = Colors.purple.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width * 0.8,
        height: size.height * 0.4,
      ),
      galaxyPaint,
    );
  }

  void _drawFlowerMeadow(Canvas canvas, Size size) {
    // Niebo
    final skyPaint = Paint()..color = Colors.lightBlue[200]!;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.4),
      skyPaint,
    );

    // Trawa
    final grassPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.lightGreen[300]!, Colors.green[700]!],
      ).createShader(Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.6));
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.6),
      grassPaint,
    );

    // Kwiaty
    final flowerColors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.yellow,
      Colors.orange,
    ];

    for (int i = 0; i < 15; i++) {
      final x = ((i * 67) % size.width.toInt()).toDouble();
      final y = size.height * 0.5 + ((i * 31) % (size.height * 0.4).toInt()).toDouble();
      final color = flowerColors[i % flowerColors.length];

      // Łodyga
      final stemPaint = Paint()
        ..color = Colors.green[800]!
        ..strokeWidth = 2;
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + 20),
        stemPaint,
      );

      // Płatki
      final petalPaint = Paint()..color = color;
      for (int j = 0; j < 5; j++) {
        final angle = (j * 72) * math.pi / 180;
        canvas.drawCircle(
          Offset(
            x + 6 * math.cos(angle),
            y + 6 * math.sin(angle),
          ),
          4,
          petalPaint,
        );
      }

      // Środek kwiatu
      final centerPaint = Paint()..color = Colors.yellow[700]!;
      canvas.drawCircle(Offset(x, y), 3, centerPaint);
    }
  }

  void _drawCityscape(Canvas canvas, Size size) {
    // Nocne niebo
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.indigo[900]!, Colors.purple[900]!],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Budynki
    final buildingPaint = Paint()..color = Colors.black.withOpacity(0.8);
    final windowPaint = Paint()..color = Colors.yellow[600]!;

    // Budynek 1
    canvas.drawRect(
      Rect.fromLTWH(20, size.height * 0.4, 60, size.height * 0.6),
      buildingPaint,
    );
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 3; j++) {
        if ((i + j) % 2 == 0) {
          canvas.drawRect(
            Rect.fromLTWH(
              30 + j * 15,
              size.height * 0.45 + i * 20,
              8,
              12,
            ),
            windowPaint,
          );
        }
      }
    }

    // Budynek 2
    canvas.drawRect(
      Rect.fromLTWH(100, size.height * 0.3, 70, size.height * 0.7),
      buildingPaint,
    );
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 3; j++) {
        if ((i + j) % 3 != 0) {
          canvas.drawRect(
            Rect.fromLTWH(
              110 + j * 18,
              size.height * 0.35 + i * 20,
              10,
              12,
            ),
            windowPaint,
          );
        }
      }
    }

    // Budynek 3
    canvas.drawRect(
      Rect.fromLTWH(190, size.height * 0.5, 50, size.height * 0.5),
      buildingPaint,
    );
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 2; j++) {
        canvas.drawRect(
          Rect.fromLTWH(
            200 + j * 18,
            size.height * 0.55 + i * 20,
            8,
            12,
          ),
          windowPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
