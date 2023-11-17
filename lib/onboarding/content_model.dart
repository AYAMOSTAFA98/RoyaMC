import '../core/presentation/styles/app_images.dart';

class UnbordingContent {
  String image;
  String discription;

  UnbordingContent({required this.image, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    image: AppImages.onboarding1,
    discription: "Consult only with a doctor\nyou trust"
  ),
  UnbordingContent(
    image: AppImages.onboarding2,
    discription: "Find a lot of specialist\ndoctors in one place"
  ),
  UnbordingContent(
    image: AppImages.onboarding3,
    discription: "Get connect our Online\nConsultation"
  ),
];
