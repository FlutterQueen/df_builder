import 'base.dart';

class ClassProp extends BaseBuilder {
  final String type;
  final bool? _addToConstructor;
  final bool isStatic;
  final bool isFinal;

  ClassProp({
    required this.type,
    bool? addToConstructor,
    required String name,
    this.isStatic = false,
    this.isFinal = false,
  })  : _addToConstructor = addToConstructor,
        super(name: name);

  bool get addToConstructor => isStatic ? false : _addToConstructor ?? isFinal;
  @override
  String toString() {
    return '${isStatic ? 'static ' : ''}${isFinal ? 'final ' : ''}$type $name ;';
  }

  @override
  List<Object?> get props => [
        type,
        name,
        isStatic,
        isFinal,
      ];
}
