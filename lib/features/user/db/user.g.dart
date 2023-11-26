// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _firstMeta = const VerificationMeta('first');
  @override
  late final GeneratedColumn<String> first = GeneratedColumn<String>(
      'first', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastMeta = const VerificationMeta('last');
  @override
  late final GeneratedColumn<String> last = GeneratedColumn<String>(
      'last', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cellMeta = const VerificationMeta('cell');
  @override
  late final GeneratedColumn<String> cell = GeneratedColumn<String>(
      'cell', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String> picture = GeneratedColumn<String>(
      'picture', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [first, last, email, gender, cell, picture];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('first')) {
      context.handle(
          _firstMeta, first.isAcceptableOrUnknown(data['first']!, _firstMeta));
    } else if (isInserting) {
      context.missing(_firstMeta);
    }
    if (data.containsKey('last')) {
      context.handle(
          _lastMeta, last.isAcceptableOrUnknown(data['last']!, _lastMeta));
    } else if (isInserting) {
      context.missing(_lastMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('cell')) {
      context.handle(
          _cellMeta, cell.isAcceptableOrUnknown(data['cell']!, _cellMeta));
    } else if (isInserting) {
      context.missing(_cellMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      first: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first'])!,
      last: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      cell: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cell'])!,
      picture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String first;
  final String last;
  final String email;
  final String gender;
  final String cell;
  final String picture;
  const UserData(
      {required this.first,
      required this.last,
      required this.email,
      required this.gender,
      required this.cell,
      required this.picture});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['first'] = Variable<String>(first);
    map['last'] = Variable<String>(last);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    map['cell'] = Variable<String>(cell);
    map['picture'] = Variable<String>(picture);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      first: Value(first),
      last: Value(last),
      email: Value(email),
      gender: Value(gender),
      cell: Value(cell),
      picture: Value(picture),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      first: serializer.fromJson<String>(json['first']),
      last: serializer.fromJson<String>(json['last']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
      cell: serializer.fromJson<String>(json['cell']),
      picture: serializer.fromJson<String>(json['picture']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'first': serializer.toJson<String>(first),
      'last': serializer.toJson<String>(last),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
      'cell': serializer.toJson<String>(cell),
      'picture': serializer.toJson<String>(picture),
    };
  }

  UserData copyWith(
          {String? first,
          String? last,
          String? email,
          String? gender,
          String? cell,
          String? picture}) =>
      UserData(
        first: first ?? this.first,
        last: last ?? this.last,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        cell: cell ?? this.cell,
        picture: picture ?? this.picture,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('first: $first, ')
          ..write('last: $last, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('cell: $cell, ')
          ..write('picture: $picture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(first, last, email, gender, cell, picture);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.first == this.first &&
          other.last == this.last &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.cell == this.cell &&
          other.picture == this.picture);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> first;
  final Value<String> last;
  final Value<String> email;
  final Value<String> gender;
  final Value<String> cell;
  final Value<String> picture;
  final Value<int> rowid;
  const UserCompanion({
    this.first = const Value.absent(),
    this.last = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.cell = const Value.absent(),
    this.picture = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String first,
    required String last,
    required String email,
    required String gender,
    required String cell,
    required String picture,
    this.rowid = const Value.absent(),
  })  : first = Value(first),
        last = Value(last),
        email = Value(email),
        gender = Value(gender),
        cell = Value(cell),
        picture = Value(picture);
  static Insertable<UserData> custom({
    Expression<String>? first,
    Expression<String>? last,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<String>? cell,
    Expression<String>? picture,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (first != null) 'first': first,
      if (last != null) 'last': last,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (cell != null) 'cell': cell,
      if (picture != null) 'picture': picture,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith(
      {Value<String>? first,
      Value<String>? last,
      Value<String>? email,
      Value<String>? gender,
      Value<String>? cell,
      Value<String>? picture,
      Value<int>? rowid}) {
    return UserCompanion(
      first: first ?? this.first,
      last: last ?? this.last,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      cell: cell ?? this.cell,
      picture: picture ?? this.picture,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (first.present) {
      map['first'] = Variable<String>(first.value);
    }
    if (last.present) {
      map['last'] = Variable<String>(last.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (cell.present) {
      map['cell'] = Variable<String>(cell.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('first: $first, ')
          ..write('last: $last, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('cell: $cell, ')
          ..write('picture: $picture, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserTable user = $UserTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user];
}
