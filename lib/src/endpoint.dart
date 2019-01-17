class Endpoint {
  Endpoint(
    this.name, {
    this.parameters,
    this.requireParameters: true,
  })  : assert(name != null),
        assert(requireParameters != null);

  final String name;
  final List<String> parameters;
  final bool requireParameters;
}
