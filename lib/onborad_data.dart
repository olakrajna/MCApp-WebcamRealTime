class OnBoarding {
  final String title;
  final String image;
  final String description;

  OnBoarding({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'WELCOME\n Before you start using\n the app, learn how to use it!',
    description: "Read carefully\n and don't skip a step!",
    image: 'assets/images/body.png',
  ),
  OnBoarding(
    title: '1. Camera settings:',
    image: 'assets/images/smartphone.png',
    description: "Use auto mode or special mode to shoot close-up subjects. Turn off flash mode to avoid reflections on the skin. ",

  ),
  OnBoarding(
    title: '2. Lighting:',
    image: 'assets/images/spotlight.png',
    description: "Prepare the patient and the photo area. Ensure good lighting on the patient's skin and remove clothing or accessories for optimal photo quality.",

  ),
  OnBoarding(
    title: '3. Stabilization:',
    image: 'assets/images/phone-camera.png',
    description: "Ensure patient stabilization and proper positioning to capture a clear photo of the skin lesion. Consider using a tripod or similar device for stability.",

  ),
  OnBoarding(
    title: '4. Use the app',
    image: 'assets/images/dermatology.png',
    description: "Make sure you are close enough to get a detailed image, but at the same time not too close to avoid distortion. Hover over the change and wait for the result.",

  ),
];