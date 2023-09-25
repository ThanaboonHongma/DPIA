import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NecessityandProportionlityListview extends StatefulWidget {
  const NecessityandProportionlityListview({super.key});

  @override
  State<NecessityandProportionlityListview> createState() =>
      _NecessityandProportionlityListviewState();
}

class _NecessityandProportionlityListviewState
    extends State<NecessityandProportionlityListview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DpiaProvider>(context);
    return ListView.builder(
      itemCount: provider.necessityandProportionlitys.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(children: [
          ...provider.necessityandProportionlitys[index].list
              .map(
                (checkbox) => CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  side: const BorderSide(color: Color(0xff2684FF)),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkbox.isChecked,
                  onChanged: (bool? value) {
                    if (value != null) {
                      provider.checkNecessityandProportionlity(
                          index, value, checkbox);
                    }
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
