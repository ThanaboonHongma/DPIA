import 'package:flutter/material.dart';

class ProosedMeasures extends StatefulWidget {
  const ProosedMeasures({super.key});

  @override
  State<ProosedMeasures> createState() => PproosedmeasuMesState();
}

class PproosedmeasuMesState extends State<ProosedMeasures> {
  DateTime selectedDate = DateTime.now();
  bool? dpoagree = false;
  bool? dponotagree = false;
  bool? listenagree = false;
  bool? listennotagree = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('มาตรการที่เสนอดำเนินการ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ..._measures(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('ความเสี่ยงที่เหลืออยู่',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ..._remainingrisk(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('ความเห็นของ DPO :',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  ..._dpo(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('ผลจากการปรึกษาหารือและรับฟังความเห็น :',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  ..._listenopinions(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _measures() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'มาตรการที่ 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Text(
            'มาตรการที่ 2',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Text(
            'มาตรการที่ 3',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Text(
            'ชื่อโครงการ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Text(
            'ตั้งแต่วันที่',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
              onPressed: () => _selectDate(context),
              child: SizedBox(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                          .split(' ')[0],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(
                      Icons.date_range_outlined,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          ),
          Text(
            'ผู้รับผิดชอบคือ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  _remainingrisk() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'ความเสี่ยงที่ 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'ความเสี่ยงที่ 2',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'ความเสี่ยงที่ 3',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  _dpo() {
    return [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: CheckboxListTile(
                  title: const Text('เห็นด้วย'),
                  value: dpoagree,
                  onChanged: (bool? newValue) {
                    setState(() {
                      dpoagree = newValue;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                width: 150,
                child: CheckboxListTile(
                  title: const Text('ไม่เห็นด้วย'),
                  value: dponotagree,
                  onChanged: (bool? newValue) {
                    setState(() {
                      dponotagree = newValue;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
          ),
        ],
      )
    ];
  }

  _listenopinions() {
    return [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: CheckboxListTile(
                  title: const Text('เห็นด้วย'),
                  value: listenagree,
                  onChanged: (bool? newValue) {
                    setState(() {
                      listenagree = newValue;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                width: 150,
                child: CheckboxListTile(
                  title: const Text('ไม่เห็นด้วย'),
                  value: listennotagree,
                  onChanged: (bool? newValue) {
                    setState(() {
                      listennotagree = newValue;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
          ),
        ],
      )
    ];
  }
}
