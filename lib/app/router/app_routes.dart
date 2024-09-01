// ignore_for_file: unused_element

enum AppRoute {
  home(''),
  settings('settings', parent: AppRoute.home);

  const AppRoute(this._path, {this.parent});

  final AppRoute? parent;
  final String _path;

  String get path => parent == null ? '/$_path' : _path;
}
