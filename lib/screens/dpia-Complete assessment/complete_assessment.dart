import 'package:dpia_project/models/activity.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'แบบฟอร์มประเมิน DPIA',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/CompletePage/iconpass.png'),
            const SizedBox(height: 16), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Text(
              'ทำประเมินเสร็จสิ้น!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final provider = Provider.of<DpiaProvider>(context, listen: false);

                    for(Activity activity in provider.activities){
                      print('${activity.id} ${activity.isChecked}');
                    }

      print(provider.checkboxValue1);
      print(provider.checkboxValue2);
                
                    context.pushReplacement('/HomePage');
                  },
                  child: const Text('OK')),
            ),
          ],
        ),
      ),
    );
  }
}
