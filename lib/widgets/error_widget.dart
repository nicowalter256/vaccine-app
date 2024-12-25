import 'dart:io';

import 'package:dio_http/dio_http.dart';
import 'package:flutter/material.dart';
import 'package:vaccination/constants/colors.dart';

class AppErrorWidget extends StatelessWidget {
  final dynamic exception;
  final bool retry;
  final Function onTap;
  const AppErrorWidget(
      {super.key, this.exception, this.retry = false, required this.onTap});
  @override
  Widget build(BuildContext context) {
    if (exception is DioError) {
      DioError dioError = exception;
      if (dioError.type == DioErrorType.connectTimeout ||
          dioError.type == DioErrorType.sendTimeout ||
          dioError.type == DioErrorType.receiveTimeout) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.warning,
              size: 100,
              color: redAccent,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Center(
                child: Text(
                  'Uh oh! It appears the connection timed out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: retry,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Retry'),
                ),
              ),
            )
          ],
        );
      } else if (dioError.type == DioErrorType.other) {
        if (dioError.error is SocketException) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.warning,
                size: 100,
                color: redAccent,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Center(
                  child: Text(
                    'Uh oh! It appears there is no internet connection',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Visibility(
                visible: retry,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Retry'),
                  ),
                ),
              )
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.warning,
                size: 100,
                color: redAccent,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Center(
                  child: Text(
                    'Whoops! Something went wrong, our engineers have been alerted',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Visibility(
                visible: retry,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Retry'),
                  ),
                ),
              )
            ],
          );
        }
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.warning,
              size: 100,
              color: redAccent,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Center(
                child: Text(
                  'Whoops! Something went wrong, our engineers have been alerted',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: retry,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Retry'),
                ),
              ),
            )
          ],
        );
      }
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.warning,
            size: 100,
            color: redAccent,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Center(
              child: Text(
                'Whoops! Something went wrong, our engineers have been alerted',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Visibility(
            visible: retry,
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text('Retry'),
              ),
            ),
          )
        ],
      );
    }
  }
}
