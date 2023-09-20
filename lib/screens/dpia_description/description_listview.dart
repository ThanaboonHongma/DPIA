import 'package:dpia_project/models/descriptions/description.dart';
import 'package:flutter/material.dart';

class DescriptionListview extends StatefulWidget {
  const DescriptionListview({super.key});

  @override
  State<DescriptionListview> createState() => _DescriptionListviewState();
}

class _DescriptionListviewState extends State<DescriptionListview> {
  List<Description> descriptions = defaltDescription.map((e) => e).toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: descriptions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
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
            padding: const EdgeInsets.all(10),
            child: ExpansionTile(
                title: Text(
                  descriptions[index].title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color.fromRGBO(35, 169, 225, 1),
                      ),
                ),
                children: [
                  const Divider(
                    color: Color(0xffC4C4C6),
                    thickness: 1,
                  ),
                  ...descriptions[index]
                      .list
                      .map(
                        (checkbox) => CheckboxListTile(
                          side: const BorderSide(color: Color(0xff2684FF)),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: checkbox.isChecked,
                          onChanged: (bool? value) {
                            List<Description> temp = [];
                            for (Description des in descriptions) {
                              if (des == descriptions[index]) {
                                final list = des.list
                                    .map((i) => i == checkbox
                                        ? i.copyWith(isChecked: value)
                                        : i)
                                    .toList();
                                temp.add(des.copyWith(list: list));
                              } else {
                                temp.add(des);
                              }
                            }
                            setState(() {
                              descriptions = temp;
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
                ]),
          ),
        );
      },
    );
  }
}
