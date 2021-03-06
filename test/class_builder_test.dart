import 'package:df_builder/df_builder.dart';
import 'package:test/test.dart';

void main() {
  test('it build the private getter correctly', () {
    final cClass = ClassBuilder(name: '_foo');
    expect(cClass.isPrivate, isTrue);
    final cClass2 = ClassBuilder(name: 'foo');
    expect(cClass2.isPrivate, isFalse);
  });

  group(
    'constructorProps',
    () {
      test('it return empty if no props', () {
        final cClass = ClassBuilder(name: 'foo');
        expect(cClass.constructorProps(), '');
      });
      test('it return props if exists', () {
        final cClass = ClassBuilder(
          name: 'foo',
          classProps: [
            ClassProp(type: 'String', name: 'foo', isFinal: true),
            ClassProp(type: 'String', name: 'bar', isFinal: true),
          ],
        );
        expect(cClass.constructorProps(), 'this.foo,this.bar,');
      });
    },
  );

  group('topCommentsBuilder', () {
    test('it return empty if none added', () {
      final cClass = ClassBuilder(name: 'foo');
      expect(cClass.topCommentsBuilder(), '');
    });
    test('it return class props if added', () {
      final cClass = ClassBuilder(
        name: 'foo',
        topComments: [
          '/// this is a comment',
          '/// this is a comment 2',
        ],
      );
      expect(cClass.topCommentsBuilder(),
          '/// this is a comment\n/// this is a comment 2\n');
    });
  });
  group('classPropsBuilder', () {
    test('it return empty if none added', () {
      final cClass = ClassBuilder(name: 'foo');
      expect(cClass.classPropsBuilder(), '');
    });
    test('it return class props if added', () {
      final cClass = ClassBuilder(
        name: 'foo',
        classProps: [
          ClassProp(type: 'String', name: 'foo', isFinal: true),
          ClassProp(type: 'String', name: 'bar', isFinal: true),
        ],
      );
      expect(cClass.classPropsBuilder(),
          'final String foo ;\nfinal String bar ;\n');
    });
  });

  group('ClassBuilder toString', () {
    test('', () {
      final cClass = ClassBuilder(
        name: 'foo',
        topComments: [
          '/// this is a comment',
          '/// this is a comment 2',
        ],
        classProps: [
          ClassProp(type: 'String', name: 'foo', isFinal: true),
          ClassProp(type: 'String', name: 'bar', isFinal: true),
        ],
      );
      expect(cClass.toString(),
          '/// this is a comment\n/// this is a comment 2\nclass Foo{Foo(this.foo,this.bar,);final String foo ;\nfinal String bar ;\n}');
    });
  });
  test('== operator', () {
    final builder1 = ClassBuilder(
      name: 'foo',
      classProps: [
        ClassProp(type: 'String', name: 'foo', isFinal: true),
      ],
      getters: [
        ClassGetter(name: 'foo', type: 'String', whatToReturn: 'this.foo'),
      ],
    );
    final builder2 = ClassBuilder(
      name: 'foo',
      classProps: [
        ClassProp(type: 'String', name: 'foo', isFinal: true),
      ],
      getters: [
        ClassGetter(name: 'foo', type: 'String', whatToReturn: 'this.foo'),
      ],
    );
    expect(builder1, equals(builder2));
  });
}
