import 'package:dw9_delivery_app/app/core/config/env/env.dart';
import 'package:dw9_delivery_app/app/core/ui/helps/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
            DeliveryButton(
              width: 249,
              height: 34.12,
              label: Env.i['backend_base_url'] ?? '',
              onPressed: (){},
            ),
            Text(MediaQuery.of(context).size.width.toString()),
            Text(context.screenWidth.toString()),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  width: context.percenWidth(.5),
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  width: context.percenWidth(.5),
                  height: 200,
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'text'),
            )
        ],
      ),
    );
  }
}

