
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

warningBottomSheet(
    {required BuildContext context,
      String? title,
      String? buttonText,
      String content = "",
      VoidCallback? onPress}) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 140,
                color: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        title ?? '',
                        style: Theme.of(context).textTheme.headline6
                    ),
                    Center(
                      child: Text(content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.grey)),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                            onPressed: onPress ??
                                    () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: content));
                                  Navigator.pop(context);
                                },
                            child: Center(
                              child: Text(buttonText ?? "ok",
                                  textAlign: TextAlign.center),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
