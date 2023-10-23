import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/job/job_data.dart';

abstract class JobRepository {
  Future<ResultEntity<List<JobData>>> fetchJob();
}
