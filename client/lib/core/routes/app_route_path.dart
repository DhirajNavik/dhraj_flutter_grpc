enum AppRoute {
  auth(path: "/login", pathName: "login"),
  home(path: "/home", pathName: "home");

  final String path;
  final String pathName;
  const AppRoute({required this.path, required this.pathName});
}
