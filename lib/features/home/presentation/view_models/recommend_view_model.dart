import 'package:debateseason_frontend_v1/features/home/data/models/breaking_news_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/recommend/best_chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/recommend/best_issue_room_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/recommend/chat_room_response_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/recommend_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/recommend_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class RecommendViewModel extends GetxController {
  late final RecommendRepository _recommendRepository;
  final _recommendData = Rx<UiState<RecommendEntity>>(const UiState.loading());

  UiState<RecommendEntity> get recommendData => _recommendData.value;

  //final RxList<BreakingNewsRes> breakingNews = <BreakingNewsRes>[].obs;
  //final RxList<BestChatRoomRes> top5BestChatRooms = <BestChatRoomRes>[].obs;
  //final RxList<BestIssueRoomRes> top5BestIssueRooms = <BestIssueRoomRes>[].obs;
  //final Rxn<List<ChatRoomResponseRes>> chatRoomResponse = Rxn<List<ChatRoomResponseRes>>();
  //final RxList<ChatRoomResponseRes> chatRoomResponse = <ChatRoomResponseRes>[].obs;

  @override
  void onInit() {
    super.onInit();
    _recommendRepository = Get.find<RecommendRepository>();
    fetchRecommendData();
  }

  Future<void> fetchRecommendData() async {
    try {
      final response = await _recommendRepository.getRecommend();
      log.d('🔍 Raw response: $response');
      _recommendData.value = response;
    } catch (e, s) {
      log.d(e);
      log.d(s);
    }
  }
}
