import 'package:flutter/material.dart';

void ToastMessage(BuildContext toastMessageContext, String title, String description, {String type = "success", bool action = true}) {
  ScaffoldMessenger.of(toastMessageContext).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              type == "error" ? Icon(Icons.error_outline_outlined, color: Colors.white, size: 25) : Icon(Icons.check_circle_outline_outlined, color: Colors.white, size: 25),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
      backgroundColor: type == "error" ? Colors.red : Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      action: action ? SnackBarAction(
        label: 'X',
        onPressed: () {
          ScaffoldMessenger.of(toastMessageContext).hideCurrentSnackBar();
        },
      ) : null,
    ),
  );
}
