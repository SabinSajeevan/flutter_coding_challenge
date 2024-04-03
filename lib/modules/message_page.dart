import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/helpers/services/api/api_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message extends ConsumerWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Your Location"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  CupertinoIcons.globe,
                  size: 40,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your Selected Country\n',
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: ref
                            .read(countriesNotifierProvider.notifier)
                            .selectedCountry,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  CupertinoIcons.location,
                  size: 40,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your Selected State\n',
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: ref
                            .read(countriesNotifierProvider.notifier)
                            .selectedState,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
