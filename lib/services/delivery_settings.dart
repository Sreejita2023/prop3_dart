import 'package:flutter/material.dart';

class DeliverySetting extends StatefulWidget {
  const DeliverySetting({super.key});

  //

  @override
  State<DeliverySetting> createState() => _DeliverySettingState();
}

class _DeliverySettingState extends State<DeliverySetting> {
  // initializations
  double baseRadius = 1.5;
  double baseCharge = 10;
  double maxRadius = 2;
  double chargePerKm = 20;
  bool partnerDelivery = true;
  bool enableSelfDelivery = false;
  int maxOrder = 10;

  @override
  // initializations
  void initState() {
    super.initState();
  }

  // checkbox
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.green;
    }
    return Colors.white;
  }

  Future<void> addData() async {
    try {
      //   todo add data to firebase
    } catch (e) {
      //   todo add error
    }
  }

  Future<void> cancelData() async {
    //    todo cancel data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Delivery Setting',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tiffinshala Partner Delivery"),
                      Text("Partner delivery is enabled"),
                    ],
                  ),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: partnerDelivery,
                  onChanged: (bool? value) {
                    setState(() {
                      partnerDelivery = value!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // max order
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Change maximum orders per hour"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider(
                          value: maxOrder.toDouble(),
                          max: 15,
                          divisions: 15,
                          onChanged: (double value) => {
                                setState(() {
                                  maxOrder = value.toInt();
                                }),
                              }),
                    ),
                    Text(" $maxOrder")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // self delivery
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Self Delivery"),
                      Text(
                          "Select this if you want to manage your own delivery"),
                    ],
                  ),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: enableSelfDelivery,
                  activeColor: Colors.green,
                  onChanged: (bool? value) {
                    setState(() {
                      enableSelfDelivery = value!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            // base radius
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Base Radius"),
                const Text("Base delivery radius"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider(
                          value: baseRadius,
                          max: 5,
                          divisions: 10,
                          onChanged: (double value) => {
                                setState(() {
                                  baseRadius = value;
                                }),
                              }),
                    ),
                    Text(" $baseRadius km")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Base Charges
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Base Charges"),
                const Text("Fixed base delivery charges on every order"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider(
                          value: baseCharge,
                          max: 20,
                          divisions: 20,
                          onChanged: (double value) => {
                                setState(() {
                                  baseCharge = value;
                                }),
                              }),
                    ),
                    Text("₹ $baseCharge")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Max Radius
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Max Radius"),
                const Text("Maximum radius where your kitchen shall be listed"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider(
                          value: maxRadius,
                          max: 5,
                          divisions: 10,
                          onChanged: (double value) => {
                                setState(() {
                                  maxRadius = value;
                                }),
                              }),
                    ),
                    Text("$maxRadius km")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // charger per km
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Charges Per km"),
                const Text("Charges per km after base radius"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider(
                          value: chargePerKm,
                          max: 100,
                          divisions: 20,
                          onChanged: (double value) => {
                                setState(() {
                                  chargePerKm = value;
                                }),
                              }),
                    ),
                    Text("₹ $chargePerKm /km")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addData();
                    },
                    child: const Text("Update"),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cancelData();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
