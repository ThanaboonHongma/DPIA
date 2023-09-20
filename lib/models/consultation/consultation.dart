//create Consultation model class with the following properties (id,title, subtitle, description, isChecked) and constructor, copyWith.
class Consultation {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final bool isChecked;

  const Consultation({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isChecked = false,
  });

  Consultation copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? description,
    bool? isChecked,
  }) {
    return Consultation(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

//create List of Consultation with the following data (id,title, subtitle, description, isChecked)
const List<Consultation> defaultConsultation = [
  Consultation(
    id: 2,
    title: "[Data subject] เจ้าของข้อมูลส่วนบุคคล",
    subtitle: "[Data subject]",
    description:
        "โดยทั่วไปแล้วผู้ควบคุมข้อมูลควรต้องรับฟังความเห็นจากเจ้าของข้อมูลส่วน บุคคล เว้นแต่จะมีเหตุผลความจำเป็นที่ไม่สามารถดำเนินการได้ ในกรณีเช่นนั้นผู้ควบคุมข้อมูลจะต้องบันทึกการตัดสินใจพร้อมเหตุผลคำอธิบายดังกล่าวไว้ใน DPIA ตัวอย่างเช่น ผู้ควบคุมข้อมูลอาจตัดสินใจไม่รับฟังความเห็นจากเจ้า",
    isChecked: false,
  ),
  Consultation(
    id: 3,
    title: "[Data processor] ผู้ประมวลผลข้อมูลส่วนตัว",
    subtitle: "[Data processor]",
    description:
        "ในกรณีที่มีการใช้ผู้ประมวลผลข้อมูลส่วนบุคคล ผู้ควบคุมข้อมูลควรจัดทำ DPIA ประกอบกับข้อมูลที่เกี่ยวข้องของผู้ประมวลผลข้อมูล ในกรณีนี้ข้อตกลงให้ประมวลผลข้อมูล (Data Processing Agreement) ควรระบุหน้าที่ในเรื่องนี้ไว้ด้วย",
    isChecked: false,
  ),
  Consultation(
    id: 4,
    title:
        "[Internal stakeholders] ผู้เกี่ยวข้องภายในองค์กร รวมถึงเจ้าหน้าที่คุ้มครองข้อมูลส่วนบุคคล (DPO)",
    subtitle: "[Internal stakeholders]",
    description:
        "ผู้ควบคุมข้อมูลควรรับฟังความเห็นจากผู้เกี่ยวข้องภายในองค์กร โดยเฉพาะอย่างยิ่งผู้ที่มีหน้าที่รับผิดชอบต่อมาตรการความปลอดภัยทางสารสนเทศ",
    isChecked: false,
  ),
  Consultation(
    id: 5,
    title:
        "[Independent experts] ผู้เชี่ยวชาญทางกฎหมายและผู้เชี่ยวชาญด้านที่เกี่ยวข้องจากภายนอก",
    subtitle: "[Independent experts]",
    description:
        "ในกรณีที่สมควร ผู้ควบคุมข้อมูลควรรับฟังความเห็นจากผู้เชี่ยวชาญทางกฎหมายและผู้เชี่ยวชาญด้านที่เกี่ยวข้องจากภายนอก เช่น ผู้เชี่ยวชาญด้านสารสนเทศ, ผู้เชี่ยวชาญด้านสังคมวิทยา, ผู้เชี่ยวชาญด้านชาติพันธุ์ เป็นต้น",
    isChecked: false,
  ),
  Consultation(
    id: 6,
    title: "[Data Protection Agency] สำนักงานคณะกรรมการคุ้มครองข้อมูลส่วนบุคคล",
    subtitle: "[Data Protection Agency]",
    description:
        "ในบางกรณีผู้ควบคุมข้อมูลอาจขอความเห็นจาก สำนักงานคณะกรรมการคุ้มครองข้อมูลส่วนบุคคล",
    isChecked: false,
  ),
];
