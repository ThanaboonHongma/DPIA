import 'package:dpia_project/models/NecessityandProportionlity/necessityandproportionlity.dart';
import 'package:flutter/material.dart';

class NecessityandProportionlityListview extends StatefulWidget {
  const NecessityandProportionlityListview({super.key});

  @override
  State<NecessityandProportionlityListview> createState() =>
      _NecessityandProportionlityListviewState();
}

class _NecessityandProportionlityListviewState
    extends State<NecessityandProportionlityListview> {
  List<NecessityandProportionlity> necessityandproportionlitys =
      defaltnecessityandProportionlity.map((e) => e).toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: necessityandproportionlitys.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(children: [
          ...necessityandproportionlitys[index]
              .list
              .map(
                (checkbox) => CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  side: const BorderSide(color: Color(0xff2684FF)),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkbox.isChecked,
                  onChanged: (bool? value) {
                    List<NecessityandProportionlity> temp = [];
                    for (NecessityandProportionlity nec
                        in necessityandproportionlitys) {
                      if (nec == necessityandproportionlitys[index]) {
                        final list = nec.list
                            .map((i) => i == checkbox
                                ? i.copyWith(isChecked: value)
                                : i)
                            .toList();
                        temp.add(nec.copyWith(list: list));
                      } else {
                        temp.add(nec);
                      }
                    }
                    setState(() {
                      necessityandproportionlitys = temp;
                    });
                  },
                  title: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: Text(
                      checkbox.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              )
              .toList(),
        ]);
      },
    );
  }
}
