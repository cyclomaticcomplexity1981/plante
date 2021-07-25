// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object?> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'barcode',
      serializers.serialize(object.barcode,
          specifiedType: const FullType(String)),
      'langsPrioritized',
      serializers.serialize(object.langsPrioritized,
          specifiedType:
              const FullType(BuiltList, const [const FullType(LangCode)])),
      'nameLangs',
      serializers.serialize(object.nameLangs,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(LangCode), const FullType(String)])),
      'ingredientsTextLangs',
      serializers.serialize(object.ingredientsTextLangs,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(LangCode), const FullType(String)])),
      'ingredientsAnalyzedLangs',
      serializers.serialize(object.ingredientsAnalyzedLangs,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(LangCode),
            const FullType(BuiltList, const [const FullType(Ingredient)])
          ])),
      'imageFrontLangs',
      serializers.serialize(object.imageFrontLangs,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(LangCode), const FullType(Uri)])),
      'imageFrontThumbLangs',
      serializers.serialize(object.imageFrontThumbLangs,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(LangCode), const FullType(Uri)])),
      'imageIngredientsLangs',
      serializers.serialize(object.imageIngredientsLangs,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(LangCode), const FullType(Uri)])),
    ];
    Object? value;
    value = object.vegetarianStatus;
    if (value != null) {
      result
        ..add('vegetarianStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(VegStatus)));
    }
    value = object.vegetarianStatusSource;
    if (value != null) {
      result
        ..add('vegetarianStatusSource')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(VegStatusSource)));
    }
    value = object.veganStatus;
    if (value != null) {
      result
        ..add('veganStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(VegStatus)));
    }
    value = object.veganStatusSource;
    if (value != null) {
      result
        ..add('veganStatusSource')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(VegStatusSource)));
    }
    value = object.moderatorVegetarianChoiceReasonId;
    if (value != null) {
      result
        ..add('moderatorVegetarianChoiceReasonId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.moderatorVegetarianSourcesText;
    if (value != null) {
      result
        ..add('moderatorVegetarianSourcesText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.moderatorVeganChoiceReasonId;
    if (value != null) {
      result
        ..add('moderatorVeganChoiceReasonId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.moderatorVeganSourcesText;
    if (value != null) {
      result
        ..add('moderatorVeganSourcesText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brands;
    if (value != null) {
      result
        ..add('brands')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'barcode':
          result.barcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vegetarianStatus':
          result.vegetarianStatus = serializers.deserialize(value,
              specifiedType: const FullType(VegStatus)) as VegStatus?;
          break;
        case 'vegetarianStatusSource':
          result.vegetarianStatusSource = serializers.deserialize(value,
                  specifiedType: const FullType(VegStatusSource))
              as VegStatusSource?;
          break;
        case 'veganStatus':
          result.veganStatus = serializers.deserialize(value,
              specifiedType: const FullType(VegStatus)) as VegStatus?;
          break;
        case 'veganStatusSource':
          result.veganStatusSource = serializers.deserialize(value,
                  specifiedType: const FullType(VegStatusSource))
              as VegStatusSource?;
          break;
        case 'moderatorVegetarianChoiceReasonId':
          result.moderatorVegetarianChoiceReasonId = serializers
              .deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'moderatorVegetarianSourcesText':
          result.moderatorVegetarianSourcesText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'moderatorVeganChoiceReasonId':
          result.moderatorVeganChoiceReasonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'moderatorVeganSourcesText':
          result.moderatorVeganSourcesText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'langsPrioritized':
          result.langsPrioritized.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LangCode)]))!
              as BuiltList<Object?>);
          break;
        case 'brands':
          result.brands.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nameLangs':
          result.nameLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(LangCode), const FullType(String)]))!);
          break;
        case 'ingredientsTextLangs':
          result.ingredientsTextLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(LangCode), const FullType(String)]))!);
          break;
        case 'ingredientsAnalyzedLangs':
          result.ingredientsAnalyzedLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(LangCode),
                const FullType(BuiltList, const [const FullType(Ingredient)])
              ]))!);
          break;
        case 'imageFrontLangs':
          result.imageFrontLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(LangCode), const FullType(Uri)]))!);
          break;
        case 'imageFrontThumbLangs':
          result.imageFrontThumbLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(LangCode), const FullType(Uri)]))!);
          break;
        case 'imageIngredientsLangs':
          result.imageIngredientsLangs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(LangCode), const FullType(Uri)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final String barcode;
  @override
  final VegStatus? vegetarianStatus;
  @override
  final VegStatusSource? vegetarianStatusSource;
  @override
  final VegStatus? veganStatus;
  @override
  final VegStatusSource? veganStatusSource;
  @override
  final int? moderatorVegetarianChoiceReasonId;
  @override
  final String? moderatorVegetarianSourcesText;
  @override
  final int? moderatorVeganChoiceReasonId;
  @override
  final String? moderatorVeganSourcesText;
  @override
  final BuiltList<LangCode> langsPrioritized;
  @override
  final BuiltList<String>? brands;
  @override
  final BuiltMap<LangCode, String> nameLangs;
  @override
  final BuiltMap<LangCode, String> ingredientsTextLangs;
  @override
  final BuiltMap<LangCode, BuiltList<Ingredient>> ingredientsAnalyzedLangs;
  @override
  final BuiltMap<LangCode, Uri> imageFrontLangs;
  @override
  final BuiltMap<LangCode, Uri> imageFrontThumbLangs;
  @override
  final BuiltMap<LangCode, Uri> imageIngredientsLangs;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._(
      {required this.barcode,
      this.vegetarianStatus,
      this.vegetarianStatusSource,
      this.veganStatus,
      this.veganStatusSource,
      this.moderatorVegetarianChoiceReasonId,
      this.moderatorVegetarianSourcesText,
      this.moderatorVeganChoiceReasonId,
      this.moderatorVeganSourcesText,
      required this.langsPrioritized,
      this.brands,
      required this.nameLangs,
      required this.ingredientsTextLangs,
      required this.ingredientsAnalyzedLangs,
      required this.imageFrontLangs,
      required this.imageFrontThumbLangs,
      required this.imageIngredientsLangs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(barcode, 'Product', 'barcode');
    BuiltValueNullFieldError.checkNotNull(
        langsPrioritized, 'Product', 'langsPrioritized');
    BuiltValueNullFieldError.checkNotNull(nameLangs, 'Product', 'nameLangs');
    BuiltValueNullFieldError.checkNotNull(
        ingredientsTextLangs, 'Product', 'ingredientsTextLangs');
    BuiltValueNullFieldError.checkNotNull(
        ingredientsAnalyzedLangs, 'Product', 'ingredientsAnalyzedLangs');
    BuiltValueNullFieldError.checkNotNull(
        imageFrontLangs, 'Product', 'imageFrontLangs');
    BuiltValueNullFieldError.checkNotNull(
        imageFrontThumbLangs, 'Product', 'imageFrontThumbLangs');
    BuiltValueNullFieldError.checkNotNull(
        imageIngredientsLangs, 'Product', 'imageIngredientsLangs');
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        barcode == other.barcode &&
        vegetarianStatus == other.vegetarianStatus &&
        vegetarianStatusSource == other.vegetarianStatusSource &&
        veganStatus == other.veganStatus &&
        veganStatusSource == other.veganStatusSource &&
        moderatorVegetarianChoiceReasonId ==
            other.moderatorVegetarianChoiceReasonId &&
        moderatorVegetarianSourcesText ==
            other.moderatorVegetarianSourcesText &&
        moderatorVeganChoiceReasonId == other.moderatorVeganChoiceReasonId &&
        moderatorVeganSourcesText == other.moderatorVeganSourcesText &&
        langsPrioritized == other.langsPrioritized &&
        brands == other.brands &&
        nameLangs == other.nameLangs &&
        ingredientsTextLangs == other.ingredientsTextLangs &&
        ingredientsAnalyzedLangs == other.ingredientsAnalyzedLangs &&
        imageFrontLangs == other.imageFrontLangs &&
        imageFrontThumbLangs == other.imageFrontThumbLangs &&
        imageIngredientsLangs == other.imageIngredientsLangs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        barcode
                                                                            .hashCode),
                                                                    vegetarianStatus
                                                                        .hashCode),
                                                                vegetarianStatusSource
                                                                    .hashCode),
                                                            veganStatus
                                                                .hashCode),
                                                        veganStatusSource
                                                            .hashCode),
                                                    moderatorVegetarianChoiceReasonId
                                                        .hashCode),
                                                moderatorVegetarianSourcesText
                                                    .hashCode),
                                            moderatorVeganChoiceReasonId
                                                .hashCode),
                                        moderatorVeganSourcesText.hashCode),
                                    langsPrioritized.hashCode),
                                brands.hashCode),
                            nameLangs.hashCode),
                        ingredientsTextLangs.hashCode),
                    ingredientsAnalyzedLangs.hashCode),
                imageFrontLangs.hashCode),
            imageFrontThumbLangs.hashCode),
        imageIngredientsLangs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('barcode', barcode)
          ..add('vegetarianStatus', vegetarianStatus)
          ..add('vegetarianStatusSource', vegetarianStatusSource)
          ..add('veganStatus', veganStatus)
          ..add('veganStatusSource', veganStatusSource)
          ..add('moderatorVegetarianChoiceReasonId',
              moderatorVegetarianChoiceReasonId)
          ..add(
              'moderatorVegetarianSourcesText', moderatorVegetarianSourcesText)
          ..add('moderatorVeganChoiceReasonId', moderatorVeganChoiceReasonId)
          ..add('moderatorVeganSourcesText', moderatorVeganSourcesText)
          ..add('langsPrioritized', langsPrioritized)
          ..add('brands', brands)
          ..add('nameLangs', nameLangs)
          ..add('ingredientsTextLangs', ingredientsTextLangs)
          ..add('ingredientsAnalyzedLangs', ingredientsAnalyzedLangs)
          ..add('imageFrontLangs', imageFrontLangs)
          ..add('imageFrontThumbLangs', imageFrontThumbLangs)
          ..add('imageIngredientsLangs', imageIngredientsLangs))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  String? _barcode;
  String? get barcode => _$this._barcode;
  set barcode(String? barcode) => _$this._barcode = barcode;

  VegStatus? _vegetarianStatus;
  VegStatus? get vegetarianStatus => _$this._vegetarianStatus;
  set vegetarianStatus(VegStatus? vegetarianStatus) =>
      _$this._vegetarianStatus = vegetarianStatus;

  VegStatusSource? _vegetarianStatusSource;
  VegStatusSource? get vegetarianStatusSource => _$this._vegetarianStatusSource;
  set vegetarianStatusSource(VegStatusSource? vegetarianStatusSource) =>
      _$this._vegetarianStatusSource = vegetarianStatusSource;

  VegStatus? _veganStatus;
  VegStatus? get veganStatus => _$this._veganStatus;
  set veganStatus(VegStatus? veganStatus) => _$this._veganStatus = veganStatus;

  VegStatusSource? _veganStatusSource;
  VegStatusSource? get veganStatusSource => _$this._veganStatusSource;
  set veganStatusSource(VegStatusSource? veganStatusSource) =>
      _$this._veganStatusSource = veganStatusSource;

  int? _moderatorVegetarianChoiceReasonId;
  int? get moderatorVegetarianChoiceReasonId =>
      _$this._moderatorVegetarianChoiceReasonId;
  set moderatorVegetarianChoiceReasonId(
          int? moderatorVegetarianChoiceReasonId) =>
      _$this._moderatorVegetarianChoiceReasonId =
          moderatorVegetarianChoiceReasonId;

  String? _moderatorVegetarianSourcesText;
  String? get moderatorVegetarianSourcesText =>
      _$this._moderatorVegetarianSourcesText;
  set moderatorVegetarianSourcesText(String? moderatorVegetarianSourcesText) =>
      _$this._moderatorVegetarianSourcesText = moderatorVegetarianSourcesText;

  int? _moderatorVeganChoiceReasonId;
  int? get moderatorVeganChoiceReasonId => _$this._moderatorVeganChoiceReasonId;
  set moderatorVeganChoiceReasonId(int? moderatorVeganChoiceReasonId) =>
      _$this._moderatorVeganChoiceReasonId = moderatorVeganChoiceReasonId;

  String? _moderatorVeganSourcesText;
  String? get moderatorVeganSourcesText => _$this._moderatorVeganSourcesText;
  set moderatorVeganSourcesText(String? moderatorVeganSourcesText) =>
      _$this._moderatorVeganSourcesText = moderatorVeganSourcesText;

  ListBuilder<LangCode>? _langsPrioritized;
  ListBuilder<LangCode> get langsPrioritized =>
      _$this._langsPrioritized ??= new ListBuilder<LangCode>();
  set langsPrioritized(ListBuilder<LangCode>? langsPrioritized) =>
      _$this._langsPrioritized = langsPrioritized;

  ListBuilder<String>? _brands;
  ListBuilder<String> get brands =>
      _$this._brands ??= new ListBuilder<String>();
  set brands(ListBuilder<String>? brands) => _$this._brands = brands;

  MapBuilder<LangCode, String>? _nameLangs;
  MapBuilder<LangCode, String> get nameLangs =>
      _$this._nameLangs ??= new MapBuilder<LangCode, String>();
  set nameLangs(MapBuilder<LangCode, String>? nameLangs) =>
      _$this._nameLangs = nameLangs;

  MapBuilder<LangCode, String>? _ingredientsTextLangs;
  MapBuilder<LangCode, String> get ingredientsTextLangs =>
      _$this._ingredientsTextLangs ??= new MapBuilder<LangCode, String>();
  set ingredientsTextLangs(
          MapBuilder<LangCode, String>? ingredientsTextLangs) =>
      _$this._ingredientsTextLangs = ingredientsTextLangs;

  MapBuilder<LangCode, BuiltList<Ingredient>>? _ingredientsAnalyzedLangs;
  MapBuilder<LangCode, BuiltList<Ingredient>> get ingredientsAnalyzedLangs =>
      _$this._ingredientsAnalyzedLangs ??=
          new MapBuilder<LangCode, BuiltList<Ingredient>>();
  set ingredientsAnalyzedLangs(
          MapBuilder<LangCode, BuiltList<Ingredient>>?
              ingredientsAnalyzedLangs) =>
      _$this._ingredientsAnalyzedLangs = ingredientsAnalyzedLangs;

  MapBuilder<LangCode, Uri>? _imageFrontLangs;
  MapBuilder<LangCode, Uri> get imageFrontLangs =>
      _$this._imageFrontLangs ??= new MapBuilder<LangCode, Uri>();
  set imageFrontLangs(MapBuilder<LangCode, Uri>? imageFrontLangs) =>
      _$this._imageFrontLangs = imageFrontLangs;

  MapBuilder<LangCode, Uri>? _imageFrontThumbLangs;
  MapBuilder<LangCode, Uri> get imageFrontThumbLangs =>
      _$this._imageFrontThumbLangs ??= new MapBuilder<LangCode, Uri>();
  set imageFrontThumbLangs(MapBuilder<LangCode, Uri>? imageFrontThumbLangs) =>
      _$this._imageFrontThumbLangs = imageFrontThumbLangs;

  MapBuilder<LangCode, Uri>? _imageIngredientsLangs;
  MapBuilder<LangCode, Uri> get imageIngredientsLangs =>
      _$this._imageIngredientsLangs ??= new MapBuilder<LangCode, Uri>();
  set imageIngredientsLangs(MapBuilder<LangCode, Uri>? imageIngredientsLangs) =>
      _$this._imageIngredientsLangs = imageIngredientsLangs;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _barcode = $v.barcode;
      _vegetarianStatus = $v.vegetarianStatus;
      _vegetarianStatusSource = $v.vegetarianStatusSource;
      _veganStatus = $v.veganStatus;
      _veganStatusSource = $v.veganStatusSource;
      _moderatorVegetarianChoiceReasonId = $v.moderatorVegetarianChoiceReasonId;
      _moderatorVegetarianSourcesText = $v.moderatorVegetarianSourcesText;
      _moderatorVeganChoiceReasonId = $v.moderatorVeganChoiceReasonId;
      _moderatorVeganSourcesText = $v.moderatorVeganSourcesText;
      _langsPrioritized = $v.langsPrioritized.toBuilder();
      _brands = $v.brands?.toBuilder();
      _nameLangs = $v.nameLangs.toBuilder();
      _ingredientsTextLangs = $v.ingredientsTextLangs.toBuilder();
      _ingredientsAnalyzedLangs = $v.ingredientsAnalyzedLangs.toBuilder();
      _imageFrontLangs = $v.imageFrontLangs.toBuilder();
      _imageFrontThumbLangs = $v.imageFrontThumbLangs.toBuilder();
      _imageIngredientsLangs = $v.imageIngredientsLangs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Product build() {
    _$Product _$result;
    try {
      _$result = _$v ??
          new _$Product._(
              barcode: BuiltValueNullFieldError.checkNotNull(
                  barcode, 'Product', 'barcode'),
              vegetarianStatus: vegetarianStatus,
              vegetarianStatusSource: vegetarianStatusSource,
              veganStatus: veganStatus,
              veganStatusSource: veganStatusSource,
              moderatorVegetarianChoiceReasonId:
                  moderatorVegetarianChoiceReasonId,
              moderatorVegetarianSourcesText: moderatorVegetarianSourcesText,
              moderatorVeganChoiceReasonId: moderatorVeganChoiceReasonId,
              moderatorVeganSourcesText: moderatorVeganSourcesText,
              langsPrioritized: langsPrioritized.build(),
              brands: _brands?.build(),
              nameLangs: nameLangs.build(),
              ingredientsTextLangs: ingredientsTextLangs.build(),
              ingredientsAnalyzedLangs: ingredientsAnalyzedLangs.build(),
              imageFrontLangs: imageFrontLangs.build(),
              imageFrontThumbLangs: imageFrontThumbLangs.build(),
              imageIngredientsLangs: imageIngredientsLangs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'langsPrioritized';
        langsPrioritized.build();
        _$failedField = 'brands';
        _brands?.build();
        _$failedField = 'nameLangs';
        nameLangs.build();
        _$failedField = 'ingredientsTextLangs';
        ingredientsTextLangs.build();
        _$failedField = 'ingredientsAnalyzedLangs';
        ingredientsAnalyzedLangs.build();
        _$failedField = 'imageFrontLangs';
        imageFrontLangs.build();
        _$failedField = 'imageFrontThumbLangs';
        imageFrontThumbLangs.build();
        _$failedField = 'imageIngredientsLangs';
        imageIngredientsLangs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Product', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
