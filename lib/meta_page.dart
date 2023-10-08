import 'package:flutter/material.dart';

class MetaPage extends StatelessWidget {
  const MetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1B2727),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 35,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 95,
                        height: 95,
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("assets/icons/meta.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(35, -50),
                        child: Image.asset(
                          "assets/icons/success.png",
                          width: 30,
                          height: 25,
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  endIndent: 25,
                  indent: 25,
                  color: Color(0xff364041),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text.rich(TextSpan(
                        text: "Meta",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xfffbc919)),
                        children: [
                          TextSpan(
                            text: "  Collaborated\n",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          TextSpan(
                            text: "  with",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          TextSpan(
                            text: "  Pranayama",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xfffbc919)),
                          )
                        ])),
                  ),
                )
              ],
            ),
          ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xff293738),
                  borderRadius: BorderRadius.circular(15)),
              child: Table(
                border: const TableBorder(
                  horizontalInside: BorderSide(color: Colors.grey, width: 0.2),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(60),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(60),
                },
                children: [
                  const TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("Free",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    Center(
                      child: Text("Plus+",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 18,
                              fontStyle: FontStyle.italic)),
                    ),
                  ]),
                  makerow(
                    "Exercise Animation",
                    Icons.check,
                    Icons.check,
                  ),
                  makerow(
                    "No Ads",
                    Icons.check,
                    Icons.check,
                  ),
                  makerow(
                    "Theme Animation",
                    Icons.check,
                    Icons.check,
                  ),
                  makerow(
                    "Custom Breathing",
                    Icons.check,
                    Icons.check,
                  ),
                  makerow(
                    "Background Music",
                    Icons.check,
                    Icons.check,
                  ),
                ],
              )),
          const SizedBox(
            child: Column(
              children: [
                Text(
                  "You are now using",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text.rich(TextSpan(
                    text: "Pranayama ",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                    children: [
                      TextSpan(
                        text: " Plus+",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ])),
                Text(
                  "End: 18 Jul 2023",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow makerow(
    id,
    i1,
    i2,
  ) {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child:
              Text("$id", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
      Center(
        child: Icon(
          i1,
          color: i1 == "Free" ? Colors.yellow : Colors.white,
        ),
      ),
      Container(
        height: 55,
        color: const Color.fromARGB(67, 0, 0, 0),
        child: Center(
          child: Icon(
            i2,
            color: i2 == Icons.check ? Colors.yellow : Colors.white,
          ),
        ),
      ),
    ]);
  }
}
