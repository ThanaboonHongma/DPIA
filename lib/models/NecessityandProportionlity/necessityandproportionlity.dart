// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpia_project/models/descriptions/checkboxlist.dart';

class NecessityandProportionlity {
  final int id;

  final List<CheckBoxList> list;
  NecessityandProportionlity({
    required this.id,
    required this.list,
  });

  NecessityandProportionlity copyWith({
    int? id,
    List<CheckBoxList>? list,
  }) {
    return NecessityandProportionlity(
      id: id ?? this.id,
      list: list ?? this.list,
    );
  }
}

List<NecessityandProportionlity> defaltnecessityandProportionlity = [
  NecessityandProportionlity(
    id: 1,
    list: [
      CheckBoxList(
          isChecked: false,
          id: 1,
          name:
              'การประมวลผลข้อมูลส่วนบุคคลดังกล่าวช่วยให้ได้ผลลัพธ์ที่ประสงค์หรือไม่ อย่างไร'),
      CheckBoxList(
          isChecked: false,
          id: 2,
          name:
              'มีช่องทางอื่นหรือไม่ที่สามารถดำเนินการได้ตามสมควรเพื่อให้ได้ผลลัพธ์ที่ประสงค์เดียวกัน'),
      CheckBoxList(
          isChecked: false, id: 3, name: 'ฐานในการประมวลผลข้อมูลตามกฎหมาย'),
      CheckBoxList(
          isChecked: false,
          id: 4,
          name: 'แนวทางป้องกันไม่ให้มีการประมวลผลข้อมูลที่ไม่เหมาะสม'),
      CheckBoxList(
          isChecked: false,
          id: 5,
          name: 'แนวทางการดำเนินการเพื่อประกันคุณภาพของข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 6,
          name:
              'แนวทางการดำเนินการเพื่อประกันการจัดเก็บข้อมูลเท่าที่จำเป็น (data minimization) ทั้งในแง่ของประเภทข้อมูลและระยะเวลาการจัดเก็บข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 7,
          name:
              'แนวทางการแจ้งข้อมูลการประมวลผลข้อมูลที่เกี่ยวข้องแก่เจ้าของข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 8,
          name: 'แนวทางดำเนินการเพื่อรองรับการใช้สิทธิของเจ้าของข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 9,
          name:
              'มาตรการเพื่อประกันการปฏิบัติตามขั้นตอนของผู้ประมวลผลข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 10,
          name: 'มาตรการคุ้มครองการส่งข้อมูลระหว่างประเทศ'),
    ],
  ),
];
