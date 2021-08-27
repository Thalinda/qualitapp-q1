import 'package:flutter/material.dart';

class OneCardItems extends StatelessWidget {
  const OneCardItems({Key? key, required this.snap}) : super(key: key);
  final snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LimitedBox(
                maxWidth: MediaQuery.of(context).size.width * 0.49,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        snap.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snap.email,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snap.phone,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              LimitedBox(
                maxWidth: MediaQuery.of(context).size.width * 0.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Adreess",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        snap.addressInfo['street'],
                        style: TextStyle(),
                      ),
                    ),
                    Container(
                      child: Text(
                        snap.addressInfo['suite'],
                        style: TextStyle(),
                      ),
                    ),
                    Container(
                      child: Text(
                        snap.addressInfo['city'],
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
