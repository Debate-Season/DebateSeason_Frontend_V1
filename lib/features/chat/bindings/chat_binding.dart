import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/chat_rooms_messages_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/repository_impls/chat_rooms_messages_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/chat_room_view_model.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRoomsMessagesDataSource>(
      () => ChatRoomsMessagesDataSource(DioClient().dio),
    );
    Get.lazyPut<ChatRoomsMessagesRepository>(
      () => ChatRoomsMessagesRepositoryImpl(
        Get.find<ChatRoomsMessagesDataSource>(),
      ),
    );

    Get.lazyPut(() => ChatRoomViewModel());
  }
}
