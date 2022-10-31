abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetDashboardDataLoadingState extends TaskState {}

class GetDashboardDataSuccessState extends TaskState {}

class GetDashboardDataErrorState extends TaskState {}

class GetAllTasksLoadingState extends TaskState {}

class GetAllTasksSuccessState extends TaskState {}

class GetAllTasksErrorState extends TaskState {}

class NewTaskLoadingState extends TaskState {}

class NewTaskSuccessState extends TaskState {}

class NewTaskErrorState extends TaskState {}