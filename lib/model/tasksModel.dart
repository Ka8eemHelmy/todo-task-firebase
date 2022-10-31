class TasksModel {
  Response? response;
  String? status;
  String? message;

  TasksModel({this.response, this.status, this.message});

  TasksModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Response {
  List<Task>? tasks = [];

  Response({
    this.tasks,
  });

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      tasks = <Task>[];
      json['data'].forEach((v) {
        tasks!.add(Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tasks != null) {
      data['data'] = tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? image;
  dynamic voice;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? voiceUrl;

  Task(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.image,
      this.voice,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.voiceUrl});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    voice = json['voice'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    voiceUrl = json['voice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['voice'] = voice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    data['voice_url'] = voiceUrl;
    return data;
  }
}