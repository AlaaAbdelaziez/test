// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:citio/models/feedback_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackApiService {
  final Dio dio = Dio();

  Future<FeedbackResponse> sendFeedback({
    required String reportId, // ✅ أضفها هنا
    required String comment,
    required int rateValue,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print("🔴 Token is null");
      return FeedbackResponse(message: "Token is null");
    }

    const url = 'https://cms-reporting.runasp.net/api/Feedback';
    final body = {
      "reportId": reportId, // ✅ أصبح موجود
      "comment": comment,
      "rateValue": rateValue,
    };

    try {
      print("📤 Sending Feedback...");
      print("🔸 URL: $url");
      print("🔸 Body: $body");
      print("🔸 Token: $token");

      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("✅ Response Status Code: ${response.statusCode}");
      print("📥 Response Data: ${response.data}");

      return FeedbackResponse.fromJson(response.data);
    } catch (e) {
      print("❌ Error while sending feedback: $e");
      return FeedbackResponse(message: "Error: $e");
    }
  }
}
