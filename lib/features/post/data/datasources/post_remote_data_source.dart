import 'package:clean_arch/core/databases/api/end_ponits.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/params/params.dart';
import '../models/post_model.dart';
 
class PostRemoteDataSource {
  final ApiConsumer api;

  PostRemoteDataSource({required this.api});
  Future<PostModel> getPost(PostParams params) async {
    final response = await api.get("${EndPoint.post}/${params.id}");
    return PostModel.fromJson(response);
  }
}
