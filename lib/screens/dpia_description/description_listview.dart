import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionListview extends StatefulWidget {
  const DescriptionListview({super.key});

  @override
  State<DescriptionListview> createState() => _DescriptionListviewState();
}

class _DescriptionListviewState extends State<DescriptionListview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DpiaProvider>(context);
    return ListView.builder(
      itemCount: provider.descriptions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(5),
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Theme(
              data: ThemeData(dividerColor: Colors.transparent),
              child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(10),
                  title: Text(
                    provider.descriptions[index].title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                  children: [
                    const Divider(
                      color: Color(0xffC4C4C6),
                      thickness: 1,
                    ),
                    ...provider.descriptions[index].list
                        .map(
                          (checkbox) => CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            side: const BorderSide(color: Color(0xff2684FF)),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: checkbox.isChecked,
                            onChanged: (bool? value) {
                              if (value != null) {
                                provider.checkDescription(
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
                  ]),
            ),
          ),
        );
      },
    );
  }
}
