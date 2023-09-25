import 'package:dpia_project/models/NecessityandProportionlity/necessityandproportionlity.dart';
import 'package:dpia_project/models/activity.dart';
import 'package:dpia_project/models/consultation/consultation.dart';
import 'package:dpia_project/models/descriptions/checkboxlist.dart';
import 'package:dpia_project/models/descriptions/description.dart';
import 'package:dpia_project/models/dpia_determine_the_risk/determinetherisk.dart';
import 'package:dpia_project/models/monitoring/monitoring.dart';
import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';

class DpiaProvider extends ChangeNotifier {
  List<RiskData> _riskAssessments = [];
  List<Activity> _activities = [];
  List<Description> _descriptions = [];
  List<Consultation> _consultations = [];
  List<Monitoring> _monitoring = [];
  List<NecessityandProportionlity> _necessityandProportionlitys = [];
  List<Determine> _determine = [];
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;

  List<RiskData> get riskAssessments => _riskAssessments;
  List<Activity> get activities => _activities;
  List<Description> get descriptions => _descriptions;
  List<Consultation> get consultations => _consultations;
  List<NecessityandProportionlity> get necessityandProportionlitys =>
      _necessityandProportionlitys;
  List<Determine> get determine => _determine;
  List<Monitoring> get monitoring => _monitoring;
  bool get checkboxValue1 => _checkboxValue1;
  bool get checkboxValue2 => _checkboxValue2;

  void setupData() {
    _activities = const [
      Activity(
        id: 1,
        title: "Scoring",
        subtitle: "[Evaluation or Scoring]",
        description:
            "เป็นกระบวนการทำโปรไฟลิ่งและประเมินเพื่อคาดการณ์โดยเฉพาะจากข้อมูลต่างๆเกี่ยวกับเจ้าของข้อมูล เช่น ผลงาน,สถานะทางเศรษฐกิจ,สุขอนามัย, รสนิยมหรือ"
            "ความสนใจ, ความน่าเชื่อถือหรือพฤติกรรม, ตำแหน่งที่อยู่ หรือการเคลื่อนไหว เป็นต้น ตัวอย่างเช่น สถาบันการเงิน ดำเนินการตรวจสอบ ประวัติลูกค้า"
            "จากฐานข้อมูลเครดิตหรือฐานข้อมูล การฟอกเงิน"
            "และการก่อการร้าย (AML/CTF) หรือฐานข้อมูล"
            "การฉ้อโกง หรือบริษัทเทคโนโลยีชีวภาพสามารถ"
            "ตรวจสอบพันธุกรรมของลูกค้าเพื่อประเมินความเสี่ยงทางสุขภาพ หรือบริษัทเทคโนโลยีบางประเภทจัดทำ"
            "ฐานข้อมูลพฤติกรรมหรือข้อมูลการตลาดจาก"
            "ข้อมูลการใช้งานเว็บไซต์ เป็นต้น",
        isChecked: false,
      ),
      Activity(
        id: 2,
        title: "Automated-decision with legal effect",
        subtitle: "[Automated-decision with legal effect]",
        description:
            "เป็นการประมวลผลข้อมูลเพื่อตัดสินใจต่อตัวเจ้าของข้อมูลส่วนบุคคลอันส่งผลทางกฎหมายหรือส่งผลที่มีนัยสำคัญทำนองเดียวกันต่อบุคคล ตัวอย่างเช่น การประมวลผลข้อมูลดังกล่าวอาจนำไปสู่การจำกัดหรือเลือกปฏิบัติต่อบุคคล อย่างไรก็ดีการประมวลผลที่ส่งผลน้อยจนถึงไม่มี"
            "ผลกระทบต่อบุคคล ไม่ถือว่าเข้าข่ายนี้",
        isChecked: false,
      ),
      Activity(
        id: 3,
        title: "Systematic monitoring",
        subtitle: "[Systematic monitoring]",
        description:
            "เป็นการประมวลผลข้อมูลเพื่อใช้ในการเฝ้าสังเกตหรือเฝ้าระวังหรือควบคุมเจ้าของข้อมูลส่วนบุคคล รวมถึงการเก็บรวบรวมข้อมูลที่ดำเนินการเป็นเครือข่าย หรือเฝ้าระวังอย่างเป็นระบบในพื้นที่สาธารณะ เนื่องจากการเฝ้าระวังลักษณะนี้อาจมีการเก็บรวบรวมข้อมูลที่เจ้าของข้อมูลไม่ทราบว่าใครเป็นผู้เก็บรวบรวมข้อมูลและข้อมูลนั้นจะถูกนำไปใช้อย่างไร และในหลายกรณีบุคคลไม่สามารถหลีกเลี่ยงที่จะไม่ถูกเก็บรวบรวมข้อมูลเพื่อการประมวลผลในพื้นที่สาธารณะได้",
        isChecked: false,
      ),
      Activity(
        id: 4,
        title: "Sensitive data",
        subtitle: "[Sensitive data]",
        description:
            "การประมวลผลข้อมูลส่วนบุคคลที่อ่อนไหวและมีความเสี่ยงสูงต่อความเป็นส่วนตัวและความเสรีภาพของบุคคล ข้อมูลเช่นข้อมูลทางการแพทย์, อาชญากรรม, และการเงินมีความอ่อนไหว เนื่องจากสามารถนำมาใช้ในการละเมิดสิทธิและความเป็นส่วนตัวของบุคคล ควรรักษาข้อมูลนี้อย่างปลอดภัยและเปิดเผยเฉพาะตามข้อกำหนดของกฎหมายคุ้มครองข้อมูลส่วนบุคคล การประเมินความเสี่ยงเป็นส่วนสำคัญในการดำเนินการที่ถูกต้องและปฏิบัติตามกฎหมายในสถานการณ์นี้",
        isChecked: false,
      ),
      Activity(
        id: 5,
        title: "Large scale",
        subtitle: "[Large scale]",
        description: "เป็นการประมวลผลปริมาณมากโดยพิจารณาจากปัจจัยดังต่อไปนี้"
            "o จำนวนเจ้าของข้อมูลส่วนบุคคลที่เกี่ยวข้อง"
            "o ปริมาณข้อมูลหรือขอบเขตของข้อมูลต่างๆที่ถูกประมวลผล"
            "o ระยะเวลาของการประมวลผล"
            "o ขอบเขตทางภูมิศาสตร์ของการประมวลผล",
        isChecked: false,
      ),
      Activity(
        id: 6,
        title: "Combining datasets",
        subtitle: "[Combining datasets]",
        description:
            "เป็นการประมวลผลที่ได้มาจากการประมวลผลข้อมูลส่วนบุคคลตั้งแต่ 2 กระบวนการขึ้นไปที่มีขอบเขตและวัตถุประสงค์แตกต่างกันหรือประมวลผลโดยผู้ควบคุมข้อมูลคนละรายกัน ซึ่งอาจทำให้การประมวลผลดังกล่าวเกินกว่าขอบเขตที่เจ้าของข้อมูลส่วนบุคคลจะคาดหมายได้ว่าจะมีการประมวลผลข้อมูลเช่นว่านั้น",
        isChecked: false,
      ),
      Activity(
        id: 7,
        title: "Vulnerable data subjects",
        subtitle: "[Vulnerable data subjects]",
        description:
            "เป็นการประมวลผลข้อมูลที่เกี่ยวกับผู้เปราะบางที่มีข้อจำกัดในทางที่เสียเปรียบที่อาจไม่สามารถให้ความยินยอมหรือปฏิเสธการประมวลผลข้อมูลเพื่อการใช้สิทธิของตนได้ ผู้เปราะบางอาจรวมถึง เด็กหรือผู้เยาว์ที่อาจไม่เข้าใจหรือไม่ตั้งใจที่จะให้ความยินยอมหรือปฏิเสธการประมวลผล หรือลูกจ้างและพนักงาน หรือบุคคลกลุ่มเฉพาะที่ต้องการความคุ้มครองเป็นพิเศษ เช่น ผู้ป่วยทางจิต, ผู้ลี้ภัย, ผู้สูงอายุ หรือผู้ป่วย เป็นต้น หรือกรณีใดๆที่สามารถระบุข้อจำกัดหรือความเสียเปรียบทำนองเดียวกันนี้ระหว่างเจ้าของข้อมูลส่วนบุคคลกับผูค้ วบคุมขอ้ มูลส่วนบุคคล",
        isChecked: false,
      ),
      Activity(
        id: 8,
        title: "Innovative use",
        subtitle: "[Innovative use]",
        description:
            "เป็นการประมวลผลที่ใช้เทคโนโลยี เช่น ลายนิ้วมือและการจดจำใบหน้าเพื่อการควบคุมการเข้าออกอาคารสถานที่ เป็นต้น เนื่องจากการใช้เทคโนโลยีลักษณะนี้นำไปสู่การเก็บรวบรวมและการใช้ข้อมูลส่วนบุคคลที่คนทั่วไปไม่คุ้นเคยมาก่อนและอาจนำไปสู่ความเสี่ยงระดับสูงที่จะมีผลกระทบต่อสิทธิเสรีภาพของบุคคลเพราะการใช้งานลักษณะนั้นไม่เคยปรากฏมาก่อนทำให้ไม่สามารถคาดหมายผลกระทบต่อตัวบุคคลและสังคมโดยรวมได้ ตัวอย่างเช่น การใช้แอพพลิเคชั่นของเทคโนโลยี IoT เป็นนวัตกรรมใหม่ที่ยังไม่สามารถคาดหมายผลกระทบที่อาจเกิดขึ้นได้ จึงจำเป็นต้องทำการประเมิน DPIA",
        isChecked: false,
      ),
      Activity(
        id: 9,
        title: "Prevent data subjects’ right or access",
        subtitle: "[Prevent data subjects’ right or access]",
        description:
            "เป็นกรณีที่การประมวลผลนั้นๆส่งผลเป็นการให้ เปลี่ยนแปลง หรือปฏิเสธ สิทธิของเจ้าของข้อมูลส่วนบุคคลที่จะเข้าถึงบริการหรือสัญญาหนึ่งๆ ตัวอย่างเช่น ธนาคารทำการตรวจสอบประวัติลูกค้าด้วยข้อมูลเครดิตเพื่อที่จะกำหนดวงเงินกู้ เป็นต้น",
        isChecked: false,
      ),
      Activity(
        id: 10,
        title: "New technologies",
        subtitle: "[New technologies]",
        description:
            "การประมวลผลข้อมูลส่วนบุคคลที่มีการใช้เทคโนโลยีใหม่ เช่น ปัญญาประดิษฐ์ (artificial intelligence)",
        isChecked: false,
      ),
      Activity(
        id: 11,
        title: "Denial of services",
        subtitle: "[Denial of services]",
        description:
            "การใช้โปรไฟลิ่งหรือข้อมูลที่อ่อนไหวในการปฏิเสธไม่ให้เข้าถึงบริการ",
        isChecked: false,
      ),
      Activity(
        id: 12,
        title: "Large-scale profiling",
        subtitle: "[Large-scale profiling]",
        description: "การทำโปรไฟลิ่งของบุคคลในปริมาณมาก",
        isChecked: false,
      ),
      Activity(
        id: 13,
        title: "Biometrics",
        subtitle: "[Biometrics]",
        description: "การประมวลผลข้อมูลชีวภาพ",
        isChecked: false,
      ),
      Activity(
        id: 14,
        title: "Genetic data",
        subtitle: "[Genetic data]",
        description: "การประมวลผลข้อมูลพันธุกรรม",
        isChecked: false,
      ),
      Activity(
        id: 15,
        title: "Data matching",
        subtitle: "[Data matching]",
        description:
            "การจับคู่หรือเชื่อมโยงข้อมูลหรือชุดข้อมูลจากแหล่งข้อมูลหลายแหล่ง",
        isChecked: false,
      ),
      Activity(
        id: 16,
        title: "Invisible processing",
        subtitle: "[Invisible processing]",
        description:
            "การเก็บรวบรวมข้อมูลส่วนบุคคลจากแหล่งอื่นที่ไม่ใช่จากเจ้าของข้อมูลโดยตรงโดยไม่มีการแจ้งเตือนเกี่ยวกับความเป็นส่วนตัว",
        isChecked: false,
      ),
      Activity(
        id: 17,
        title: "Tracking",
        subtitle: "[Tracking]",
        description: "การติดตามตำแหน่งที่อยู่หรือพฤติกรรมของบุคคล",
        isChecked: false,
      ),
      Activity(
        id: 18,
        title: "Targeting of children or other vulnerable individuals",
        subtitle: "Targeting of children or other vulnerable individuals",
        description:
            "การทำโปรไฟลิ่งหรือทำการตลาดแบบระบุเป้าหมาย (target marketing) หรือบริการออนไลน์แก่ ผู้เยาว์หรือผู้เปราะบาง",
        isChecked: false,
      ),
      Activity(
        id: 19,
        title: "Risk of physical harm",
        subtitle: "[Risk of physical harm]",
        description:
            "การประมวลผลข้อมูลที่อาจเป็นอันตรายต่อสุขอนามัยหรือความปลอดภัยของบุคคลในกรณีที่มีการรั่วไหล",
        isChecked: false,
      ),
    ];

    _descriptions = [
      Description(
        id: 1,
        title:
            "2.1 [Nature] อธิบายสภาพของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้",
        list: [
          CheckBoxList(isChecked: false, id: 1, name: 'การเก็บรวบรวมข้อมูล'),
          CheckBoxList(isChecked: false, id: 2, name: 'การจัดเก็บข้อมูล'),
          CheckBoxList(isChecked: false, id: 3, name: 'การใช้ข้อมูล'),
          CheckBoxList(
              isChecked: false, id: 4, name: 'ผู้ที่สามารถเข้าถึงข้อมูล'),
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
              name:
                  'ระดับความคาดหวังของเจ้าของข้อมูลที่มีต่อการประมวลผลข้อมูล'),
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

    _consultations = const [
      Consultation(
        id: 1,
        title: "[Data subject] เจ้าของข้อมูลส่วนบุคคล",
        subtitle: "[Data subject]",
        description:
            "โดยทั่วไปแล้วผู้ควบคุมข้อมูลควรต้องรับฟังความเห็นจากเจ้าของข้อมูลส่วน บุคคล เว้นแต่จะมีเหตุผลความจำเป็นที่ไม่สามารถดำเนินการได้ ในกรณีเช่นนั้นผู้ควบคุมข้อมูลจะต้องบันทึกการตัดสินใจพร้อมเหตุผลคำอธิบายดังกล่าวไว้ใน DPIA ตัวอย่างเช่น ผู้ควบคุมข้อมูลอาจตัดสินใจไม่รับฟังความเห็นจากเจ้า",
        isChecked: false,
      ),
      Consultation(
        id: 2,
        title: "[Data processor] ผู้ประมวลผลข้อมูลส่วนตัว",
        subtitle: "[Data processor]",
        description:
            "ในกรณีที่มีการใช้ผู้ประมวลผลข้อมูลส่วนบุคคล ผู้ควบคุมข้อมูลควรจัดทำ DPIA ประกอบกับข้อมูลที่เกี่ยวข้องของผู้ประมวลผลข้อมูล ในกรณีนี้ข้อตกลงให้ประมวลผลข้อมูล (Data Processing Agreement) ควรระบุหน้าที่ในเรื่องนี้ไว้ด้วย",
        isChecked: false,
      ),
      Consultation(
        id: 3,
        title:
            "[Internal stakeholders] ผู้เกี่ยวข้องภายในองค์กร รวมถึงเจ้าหน้าที่คุ้มครองข้อมูลส่วนบุคคล (DPO)",
        subtitle: "[Internal stakeholders]",
        description:
            "ผู้ควบคุมข้อมูลควรรับฟังความเห็นจากผู้เกี่ยวข้องภายในองค์กร โดยเฉพาะอย่างยิ่งผู้ที่มีหน้าที่รับผิดชอบต่อมาตรการความปลอดภัยทางสารสนเทศ",
        isChecked: false,
      ),
      Consultation(
        id: 4,
        title:
            "[Independent experts] ผู้เชี่ยวชาญทางกฎหมายและผู้เชี่ยวชาญด้านที่เกี่ยวข้องจากภายนอก",
        subtitle: "[Independent experts]",
        description:
            "ในกรณีที่สมควร ผู้ควบคุมข้อมูลควรรับฟังความเห็นจากผู้เชี่ยวชาญทางกฎหมายและผู้เชี่ยวชาญด้านที่เกี่ยวข้องจากภายนอก เช่น ผู้เชี่ยวชาญด้านสารสนเทศ, ผู้เชี่ยวชาญด้านสังคมวิทยา, ผู้เชี่ยวชาญด้านชาติพันธุ์ เป็นต้น",
        isChecked: false,
      ),
      Consultation(
        id: 5,
        title:
            "[Data Protection Agency] สำนักงานคณะกรรมการคุ้มครองข้อมูลส่วนบุคคล",
        subtitle: "[Data Protection Agency]",
        description:
            "ในบางกรณีผู้ควบคุมข้อมูลอาจขอความเห็นจาก สำนักงานคณะกรรมการคุ้มครองข้อมูลส่วนบุคคล",
        isChecked: false,
      ),
    ];

    _necessityandProportionlitys = [
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
  }

  
  //หน้า Identification (ขั้นตอนที่1.1-1.2)
    void saveDetermine(Determine determine) {
    final index =
        _monitoring.indexWhere((monitoring) => monitoring.id == determine.id);
    if (index != -1) {
      _determine[index] = determine;
    } else {
      _determine.add(determine);
    }

    notifyListeners();
  }
  
  void checkActivity(int index, bool value) {
    List<Activity> temp = [
      for (Activity activity in _activities)
        activity == _activities[index]
            ? activity.copyWith(isChecked: value)
            : activity
    ];
    _activities = temp;
    notifyListeners();
  }

  void checkBool1Activity(bool value) {
    _checkboxValue1 = value;
    notifyListeners();
  }

  void checkBool2Activity(bool value) {
    _checkboxValue2 = value;
    notifyListeners();
  }

  //หน้า Description (ขั้นตอนที่2)
  void checkDescription(int index, bool value, CheckBoxList checkbox) {
    List<Description> temp = [];
    for (Description des in _descriptions) {
      if (des == _descriptions[index]) {
        final list = des.list
            .map((i) => i == checkbox ? i.copyWith(isChecked: value) : i)
            .toList();
        temp.add(des.copyWith(list: list));
      } else {
        temp.add(des);
      }
    }

    _descriptions = temp;
    notifyListeners();
  }

  //หน้า consultations (ขั้นตอนที่3)
  void checkConsultations(int index, bool value) {
    List<Consultation> temp = [
      for (Consultation consultation in _consultations)
        consultation == _consultations[index]
            ? consultation.copyWith(isChecked: value)
            : consultation
    ];

    _consultations = temp;
    notifyListeners();
  }

  //หน้า NecessityandProportionlity (ขั้นตอนที่4)

  void checkNecessityandProportionlity(
      int index, bool value, CheckBoxList checkbox) {
    List<NecessityandProportionlity> temp = [];
    for (NecessityandProportionlity nec in _necessityandProportionlitys) {
      if (nec == _necessityandProportionlitys[index]) {
        final list = nec.list
            .map((i) => i == checkbox ? i.copyWith(isChecked: value) : i)
            .toList();
        temp.add(nec.copyWith(list: list));
      } else {
        temp.add(nec);
      }
    }
    _necessityandProportionlitys = temp;
    notifyListeners();
  }

  //หน้า RiskData (ขั้นตอนที่5-6)

  void saveRiskAssessment(RiskData riskdata) {
    final index = _riskAssessments.indexWhere((risk) => risk.id == riskdata.id);
    if (index != -1) {
      _riskAssessments[index] = riskdata;
    } else {
      _riskAssessments.add(riskdata);
    }

    notifyListeners();
  }

  void saveRiskHighLevel(RiskData riskData) {
    List<RiskData> temp = [];

    for (RiskData risk in _riskAssessments) {
      if (risk.id == riskData.id) {
        temp.add(riskData);
      } else {
        temp.add(risk);
      }
    }
    _riskAssessments = temp;
    notifyListeners();
  }

  //หน้า Monitoring (ขั้นตอนที่7)

  void saveMonitoring(Monitoring mouseRegion) {
    final index =
        _monitoring.indexWhere((monitoring) => monitoring.id == mouseRegion.id);
    if (index != -1) {
      _monitoring[index] = mouseRegion;
    } else {
      _monitoring.add(mouseRegion);
    }

    notifyListeners();
  }


}
