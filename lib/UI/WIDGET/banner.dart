import 'package:flutter/material.dart';
import 'package:food_app/shared/shared.dart';
class blokBanner extends StatelessWidget {
  const blokBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFC107), // Solid color
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    // Wrap Text widgets in Expanded to avoid overflow
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Text(
                              "Special Offer!",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              "diskon 20% untuk semua makanan",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 16.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/order');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/food/food_promo.png"), // Adjust this path to your asset
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
