import 'package:bs23_flutter_task_101/model/api_service_model/gitHub_repository_model.dart';
import 'package:hive/hive.dart';

part 'repo_list_model.g.dart';

@HiveType(typeId: 0)
class RepoListHiveModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? nodeId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? fullName;
  @HiveField(4)
  bool? private;
  @HiveField(5)
  Owner? owner;
  @HiveField(6)
  String? htmlUrl;
  @HiveField(7)
  String? description;
  @HiveField(8)
  bool? fork;
  @HiveField(9)
  String? url;
  @HiveField(10)
  String? forksUrl;
  @HiveField(11)
  String? keysUrl;
  @HiveField(12)
  String? collaboratorsUrl;
  @HiveField(13)
  String? teamsUrl;
  @HiveField(14)
  String? hooksUrl;
  @HiveField(15)
  String? issueEventsUrl;
  @HiveField(16)
  String? eventsUrl;
  @HiveField(17)
  String? assigneesUrl;
  @HiveField(18)
  String? branchesUrl;
  @HiveField(19)
  String? tagsUrl;
  @HiveField(20)
  String? blobsUrl;
  @HiveField(21)
  String? gitTagsUrl;
  @HiveField(22)
  String? gitRefsUrl;
  @HiveField(23)
  String? treesUrl;
  @HiveField(24)
  String? statusesUrl;
  @HiveField(25)
  String? languagesUrl;
  @HiveField(26)
  String? stargazersUrl;
  @HiveField(27)
  String? contributorsUrl;
  @HiveField(28)
  String? subscribersUrl;
  @HiveField(29)
  String? subscriptionUrl;
  @HiveField(30)
  String? commitsUrl;
  @HiveField(31)
  String? gitCommitsUrl;
  @HiveField(32)
  String? commentsUrl;
  @HiveField(33)
  String? issueCommentUrl;
  @HiveField(34)
  String? contentsUrl;
  @HiveField(35)
  String? compareUrl;
  @HiveField(36)
  String? mergesUrl;
  @HiveField(37)
  String? archiveUrl;
  @HiveField(38)
  String? downloadsUrl;
  @HiveField(39)
  String? issuesUrl;
  @HiveField(40)
  String? pullsUrl;
  @HiveField(41)
  String? milestonesUrl;
  @HiveField(42)
  String? notificationsUrl;
  @HiveField(43)
  String? labelsUrl;
  @HiveField(44)
  String? releasesUrl;
  @HiveField(45)
  String? deploymentsUrl;
  @HiveField(46)
  DateTime? createdAt;
  @HiveField(47)
  DateTime? updatedAt;
  @HiveField(48)
  DateTime? pushedAt;
  @HiveField(49)
  String? gitUrl;
  @HiveField(50)
  String? sshUrl;
  @HiveField(51)
  String? cloneUrl;
  @HiveField(52)
  String? svnUrl;
  @HiveField(53)
  String? homepage;
  @HiveField(54)
  int? size;
  @HiveField(55)
  int? stargazersCount;
  @HiveField(56)
  int? watchersCount;
  @HiveField(57)
  String? language;
  @HiveField(58)
  bool? hasIssues;
  @HiveField(59)
  bool? hasProjects;
  @HiveField(60)
  bool? hasDownloads;
  @HiveField(61)
  bool? hasWiki;
  @HiveField(62)
  bool? hasPages;
  @HiveField(63)
  bool? hasDiscussions;
  @HiveField(64)
  int? forksCount;
  @HiveField(65)
  dynamic mirrorUrl;
  @HiveField(66)
  bool? archived;
  @HiveField(67)
  bool? disabled;
  @HiveField(68)
  int? openIssuesCount;
  @HiveField(69)
  License? license;
  @HiveField(70)
  bool? allowForking;
  @HiveField(71)
  bool? isTemplate;
  @HiveField(72)
  bool? webCommitSignoffRequired;
  @HiveField(73)
  List<String>? topics;
  @HiveField(74)
  Visibility? visibility;
  @HiveField(75)
  int? forks;
  @HiveField(76)
  int? openIssues;
  @HiveField(77)
  int? watchers;
  @HiveField(78)
  DefaultBranch? defaultBranch;
  @HiveField(79)
  double? score;

  RepoListHiveModel({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });
}
