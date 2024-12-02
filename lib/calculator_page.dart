import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int input1 = 0;
  int input2 = 0;
  String inputSummary = "";
  String valueOperational = "";
  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight) / 3.1;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Text(
                  "$input1 $valueOperational $input2 = $inputSummary" ??
                      "Hasil penjumlahan",
                ),
                padding: EdgeInsets.all(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GridView.extent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width / 3,
                          childAspectRatio: (itemWidth / itemHeight),
                          shrinkWrap: true,
                          children: List.generate(
                              9,
                              (index) => Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (valueOperational.isEmpty) {
                                              input1 = index + 1;
                                            } else {
                                              input2 = index + 1;
                                            }

                                            debugPrint("$input1");
                                          });
                                        },
                                        child: Container(
                                            child: Text("${index + 1}"))),
                                  )),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 41,
                                  vertical:
                                      MediaQuery.of(context).size.height / 17),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Text("%"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical:
                                      MediaQuery.of(context).size.height / 17),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Text("0"),
                            ),
                            InkWell(
                              onTap: () {
                                switch (valueOperational) {
                                  case "/":
                                    setState(() {
                                      inputSummary = "${input1 / input2}";
                                      valueOperational = "";
                                    });

                                    break;
                                  case "+":
                                    setState(() {
                                      inputSummary = "${input1 + input2}";
                                      valueOperational = "";
                                    });
                                    break;
                                  case "-":
                                    setState(() {
                                      inputSummary = "${input1 - input2}";
                                      valueOperational = "";
                                    });
                                    break;
                                  case "*":
                                    setState(() {
                                      inputSummary = "${input1 + input2}";
                                      input1 = 0;
                                      input2 = 0;
                                      valueOperational = "";
                                    });
                                    break;
                                  default:
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 41,
                                    vertical:
                                        MediaQuery.of(context).size.height /
                                            17),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Text("="),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _buildButtonOperational("/", () {
                        setState(() {
                          valueOperational = "/";
                        });
                      }),
                      _buildButtonOperational("*", () {
                        setState(() {
                          valueOperational = "*";
                        });
                      }),
                      _buildButtonOperational("+", () {
                        setState(() {
                          valueOperational = "+";
                        });
                      }),
                      _buildButtonOperational("-", () {
                        setState(() {
                          valueOperational = "-";
                        });
                      }),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonOperational(String icon, VoidCallback handleOnTap) {
    return InkWell(
      onTap: handleOnTap,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: MediaQuery.of(context).size.height / 17),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Text(icon)),
    );
  }
}
