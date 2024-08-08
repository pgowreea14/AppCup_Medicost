import 'onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "AI-Powered Medical Bills Reader",
        descriptions:
            "Effortlessly scan and manage your medical bills with AI, receive reminders, and keep track of your expenses.",
        image: "assets/images/scan.webp"), // Add a relevant image asset
    OnboardingInfo(
        title: "Find the Best Medical Store",
        descriptions:
            "Get recommendations for the best medical stores based on your prescriptions, ensuring you get the right medicines at the best prices.",
        image: "assets/images/pharmacy.webp"), // Add a relevant image asset
    OnboardingInfo(
        title: "Virtual Live Medical Consultation",
        descriptions:
            "Consult with medical professionals in real-time through virtual consultations, making healthcare more accessible and convenient.",
        image: "assets/images/assistance.png"), // Add a relevant image asset
    OnboardingInfo(
        title: "Send Medical Health Alerts",
        descriptions:
            "Send and receive alerts regarding medical health issues, medication schedules, and important health updates.",
        image: "assets/images/alert.webp"), // Add a relevant image asset
    OnboardingInfo(
        title: "Disease Heatmap",
        descriptions:
            "Visualize the spread of diseases with interactive heatmaps, helping you stay informed and make better health decisions.",
        image: "assets/images/heatmap.webp"), // Add a relevant image asset
  ];
}
