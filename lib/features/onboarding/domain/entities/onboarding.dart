class Onboarding {
  String image;
  String title;
  String subtitle;

  Onboarding({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<Onboarding> dummyOnboarding() {
  return [
    Onboarding(image: 'assets/images/im_onboarding_1.png', title: "Some Title1", subtitle: ' In publishing and graphic design, Lorem is a placeholder text commonly '),
    Onboarding(image: 'assets/images/im_onboarding_2.png', title: "Some Title2", subtitle: ' In publishing and graphic design, Lorem is a placeholder text commonly '),
    Onboarding(image: 'assets/images/im_onboarding_3.png', title: "Some Title3", subtitle: ' In publishing and graphic design, Lorem is a placeholder text commonly '),
  ];
}