import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CompletePageNoRisk extends StatelessWidget {
  CompletePageNoRisk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DpiaProvider>(context, listen: false);
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
                    context.go('/HomePage');
                    Provider.of<DpiaProvider>(context, listen: false).setupData();
                  },
                  child: const Text('OK')),
            ),
          ],
        ),
      ),
    );
  }
}
