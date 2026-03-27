// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ListViewConfigsTable extends ListViewConfigs
    with TableInfo<$ListViewConfigsTable, ListViewConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListViewConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ListViewConfigModel, String>
  config = GeneratedColumn<String>(
    'config',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ListViewConfigModel>($ListViewConfigsTable.$converterconfig);
  @override
  List<GeneratedColumn> get $columns => [name, config];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'list_view_configs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ListViewConfig> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  ListViewConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListViewConfig(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      config: $ListViewConfigsTable.$converterconfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config'],
        )!,
      ),
    );
  }

  @override
  $ListViewConfigsTable createAlias(String alias) {
    return $ListViewConfigsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ListViewConfigModel, String, Map<String, dynamic>>
  $converterconfig = const ListViewConfigConverter();
}

class ListViewConfig extends DataClass implements Insertable<ListViewConfig> {
  final String name;
  final ListViewConfigModel config;
  const ListViewConfig({required this.name, required this.config});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    {
      map['config'] = Variable<String>(
        $ListViewConfigsTable.$converterconfig.toSql(config),
      );
    }
    return map;
  }

  ListViewConfigsCompanion toCompanion(bool nullToAbsent) {
    return ListViewConfigsCompanion(name: Value(name), config: Value(config));
  }

  factory ListViewConfig.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ListViewConfig(
      name: serializer.fromJson<String>(json['name']),
      config: $ListViewConfigsTable.$converterconfig.fromJson(
        serializer.fromJson<Map<String, dynamic>>(json['config']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'config': serializer.toJson<Map<String, dynamic>>(
        $ListViewConfigsTable.$converterconfig.toJson(config),
      ),
    };
  }

  ListViewConfig copyWith({String? name, ListViewConfigModel? config}) =>
      ListViewConfig(name: name ?? this.name, config: config ?? this.config);
  ListViewConfig copyWithCompanion(ListViewConfigsCompanion data) {
    return ListViewConfig(
      name: data.name.present ? data.name.value : this.name,
      config: data.config.present ? data.config.value : this.config,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ListViewConfig(')
          ..write('name: $name, ')
          ..write('config: $config')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, config);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListViewConfig &&
          other.name == this.name &&
          other.config == this.config);
}

class ListViewConfigsCompanion extends UpdateCompanion<ListViewConfig> {
  final Value<String> name;
  final Value<ListViewConfigModel> config;
  final Value<int> rowid;
  const ListViewConfigsCompanion({
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ListViewConfigsCompanion.insert({
    required String name,
    required ListViewConfigModel config,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       config = Value(config);
  static Insertable<ListViewConfig> custom({
    Expression<String>? name,
    Expression<String>? config,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (config != null) 'config': config,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ListViewConfigsCompanion copyWith({
    Value<String>? name,
    Value<ListViewConfigModel>? config,
    Value<int>? rowid,
  }) {
    return ListViewConfigsCompanion(
      name: name ?? this.name,
      config: config ?? this.config,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(
        $ListViewConfigsTable.$converterconfig.toSql(config.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListViewConfigsCompanion(')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ListViewConfigsTable listViewConfigs = $ListViewConfigsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [listViewConfigs];
}

typedef $$ListViewConfigsTableCreateCompanionBuilder =
    ListViewConfigsCompanion Function({
      required String name,
      required ListViewConfigModel config,
      Value<int> rowid,
    });
typedef $$ListViewConfigsTableUpdateCompanionBuilder =
    ListViewConfigsCompanion Function({
      Value<String> name,
      Value<ListViewConfigModel> config,
      Value<int> rowid,
    });

class $$ListViewConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $ListViewConfigsTable> {
  $$ListViewConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ListViewConfigModel,
    ListViewConfigModel,
    String
  >
  get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$ListViewConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $ListViewConfigsTable> {
  $$ListViewConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ListViewConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ListViewConfigsTable> {
  $$ListViewConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ListViewConfigModel, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);
}

class $$ListViewConfigsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ListViewConfigsTable,
          ListViewConfig,
          $$ListViewConfigsTableFilterComposer,
          $$ListViewConfigsTableOrderingComposer,
          $$ListViewConfigsTableAnnotationComposer,
          $$ListViewConfigsTableCreateCompanionBuilder,
          $$ListViewConfigsTableUpdateCompanionBuilder,
          (
            ListViewConfig,
            BaseReferences<
              _$AppDatabase,
              $ListViewConfigsTable,
              ListViewConfig
            >,
          ),
          ListViewConfig,
          PrefetchHooks Function()
        > {
  $$ListViewConfigsTableTableManager(
    _$AppDatabase db,
    $ListViewConfigsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListViewConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListViewConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListViewConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<ListViewConfigModel> config = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ListViewConfigsCompanion(
                name: name,
                config: config,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required ListViewConfigModel config,
                Value<int> rowid = const Value.absent(),
              }) => ListViewConfigsCompanion.insert(
                name: name,
                config: config,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ListViewConfigsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ListViewConfigsTable,
      ListViewConfig,
      $$ListViewConfigsTableFilterComposer,
      $$ListViewConfigsTableOrderingComposer,
      $$ListViewConfigsTableAnnotationComposer,
      $$ListViewConfigsTableCreateCompanionBuilder,
      $$ListViewConfigsTableUpdateCompanionBuilder,
      (
        ListViewConfig,
        BaseReferences<_$AppDatabase, $ListViewConfigsTable, ListViewConfig>,
      ),
      ListViewConfig,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ListViewConfigsTableTableManager get listViewConfigs =>
      $$ListViewConfigsTableTableManager(_db, _db.listViewConfigs);
}
