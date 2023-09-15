// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpia_project/models/descriptions/checkboxlist.dart';

class Description {
  final int id;
  final String title;
  final List<CheckBoxList> list;
  Description({
    required this.id,
    required this.title,
    required this.list,
  });

  Description copyWith({
    int? id,
    String? title,
    List<CheckBoxList>? list,
  }) {
    return Description(
      id: id ?? this.id,
      title: title ?? this.title,
      list: list ?? this.list,
    );
  }
}

List<Description> defaltDescription = [
  Description(
    id: 1,
    title:
        "2.1 [Nature] อธิบายสภาพของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้",
    list: [
      CheckBoxList(isChecked: false, id: 1, name: 'การเก็บรวบรวมข้อมูล'),
      CheckBoxList(isChecked: false, id: 2, name: 'การจัดเก็บข้อมูล'),
      CheckBoxList(isChecked: false, id: 3, name: 'การใช้ข้อมูล'),
      CheckBoxList(isChecked: false, id: 4, name: 'ผู้ที่สามารถเข้าถึงข้อมูล'),
      CheckBoxList(isChecked: false, id: 5, name: 'ผู้ที่ได้รับข้อมูล'),
      CheckBoxList(isChecked: false, id: 6, name: 'ผู้ประมวลผลข้อมูล'),
      CheckBoxList(isChecked: false, id: 7, name: 'ระยะเวลาจัดเก็บข้อมูล'),
      CheckBoxList(isChecked: false, id: 8, name: 'มาตรการความปลอดภัย'),
      CheckBoxList(
          isChecked: false,
          id: 9,
          name: 'เทคโนโลยีใหม่ที่ใช่ในการประมวลผลข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 10,
          name: 'กระบวนการแบบใหม่ที่ใช้ในประมวลผลข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 11,
          name:
              'ปัจจัยที่ทำให้มีความเสี่ยงสูงที่จะมีผลกระทบต่อสิทธิเสรีภาพของบุคคล'),
    ],
  ),
  Description(
    id: 2,
    title:
        "2.2 [Scope] ระบุขอบเขตของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้",
    list: [
      CheckBoxList(
          isChecked: false, id: 1, name: 'สภาพและลักษณะของข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 2,
          name: 'ปริมาณและความหลากหลายของข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false, id: 3, name: 'ความอ่อนไหวของข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false, id: 4, name: 'ระดับและความถี่ของการประมวล'),
      CheckBoxList(
          isChecked: false, id: 5, name: 'ระยะเวลาของการประมวลผลข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 6,
          name: 'จำนวนของเจ้าของข้อมูลส่วนบุคคลที่เกี่ยวข้อง'),
      CheckBoxList(
          isChecked: false,
          id: 7,
          name: 'พื้นที่เชิงภูมิศาสตร์ที่การประมวลข้อมูลครอบคลุมไปถึง'),
    ],
  ),
  Description(
    id: 3,
    title:
        "2.3 [Context] อธิบายบริบทของการประมวลผลข้อมูล ทั้งปัจจัยภายในและภายนอกที่อาจส่งผลต่อความความคาดหวังและผลกระทบของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้",
    list: [
      CheckBoxList(isChecked: false, id: 1, name: 'แหล่งข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 2,
          name: 'ลักษณะของความสัมพันธ์กับเจ้าของข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 3,
          name:
              'ลักษณะของความสัมพันธ์กับเจ้าของข้อมูลของเจ้าของข้อมูลส่วนบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 4,
          name: 'ระดับความคาดหวังของเจ้าของข้อมูลที่มีต่อการประมวลผลข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 5,
          name: 'มีข้อมูลส่วนบุคคลของผู้เยาว์หรือผู้เปราะบางหรือไม่'),
      CheckBoxList(
          isChecked: false,
          id: 6,
          name: 'ประสบการณ์ที่ผ่านมาของการประมูลแบบเดียวกัน'),
      CheckBoxList(
          isChecked: false,
          id: 7,
          name:
              'ความก้าวหน้าทางเทคโนโลยีหรือมาตรการความปลอดภัยทางสารสนเทศที่เกี่ยวข้อง'),
      CheckBoxList(
          isChecked: false,
          id: 8,
          name: 'ประเด็นที่เป็นข้อวิตกกังวลของสาธารณะ'),
      CheckBoxList(
          isChecked: false,
          id: 9,
          name: 'มีการปฏิบัติตามมาตรฐานหรือแนวปฏิบัติที่เกี่ยวข้องหรือไม่'),
    ],
  ),
  Description(
    id: 4,
    title:
        "2.4 [Purpose] อธิบายวัตถุประสงค์ของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้",
    list: [
      CheckBoxList(
          isChecked: false,
          id: 4,
          name: 'ผลลัพธ์ที่ต้องการสำหรับผู้ควบคุมข้อมูล'),
      CheckBoxList(
          isChecked: false,
          id: 4,
          name: 'ฐานประโยชน์อันชอบธรรม (legitimate interest) (ถ้ามี)'),
      CheckBoxList(
          isChecked: false, id: 4, name: 'ผลลัพธ์ที่ต้องการสำหรับบุคคล'),
      CheckBoxList(
          isChecked: false,
          id: 4,
          name:
              'ประโยชน์ที่คาดว่าจะได้รับสำหรับผู้ควบคุมข้อมูลหรือสังคมโดยรวม'),
    ],
  )
];
