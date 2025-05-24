import 'package:fliq_dating_app/models/message_model.dart';
import 'package:fliq_dating_app/models/user_model.dart';
import 'package:fliq_dating_app/services/api_service.dart';
import 'package:japx/japx.dart';

  import 'package:shared_preferences/shared_preferences.dart';


class ChatService extends BaseApiService {
    static const _tokenKey = 'auth_token';
  ///
  ///Fetch Users
  ///
  Future<List<UserModel>> fetchChatUsers() async {
    try {
      final response = await get('/chat/chat-messages/queries/contact-users');
      final decoded = Japx.decode(response.data);
      final List<dynamic> userData = decoded['data'];
      return userData.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print("Fetch Chat Users Error: $e");
      return [];
    }
  }

  ///
  ///Fetch Messages
  ///
  Future<List<Message>> fetchChatMessages(int senderId, int receiverId) async {
    try {
      final response = await get('/chat/chat-messages/queries/chat-between-users/$senderId/$receiverId');
      final decoded = Japx.decode(response.data);
      final List<dynamic> chatData = decoded['data'];
      return chatData.map((e) => Message.fromJson(e)).toList();
    } catch (e) {
      print("Fetch Chat Messages Error: $e");
      return [];
    }
  }


  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }


}
