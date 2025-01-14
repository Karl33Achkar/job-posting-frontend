import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, title, body, Function? callback)
{
  showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: (){
                Navigator.of(context).pop();
                if(callback != null)
                {
                  callback();
                }
              },
            )
          ],
        );
      }
  );
}