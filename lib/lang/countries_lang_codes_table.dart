import 'package:plante/logging/analytics.dart';
import 'package:plante/logging/log.dart';
import 'package:plante/model/lang_code.dart';

class CountriesLangCodesTable {
  final Analytics _analytics;

  CountriesLangCodesTable(this._analytics);

  List<LangCode>? countryCodeToLangCode(String countryCode) {
    final codesStrs = _COUNTRIES_LANG_CODES_TABLE[countryCode];
    if (codesStrs == null) {
      Log.w('No language code for country $countryCode');
      _analytics
          .sendEvent('no_lang_code_for_country', {'country': countryCode});
      return null;
    }
    final result = <LangCode>[];
    for (final codeStr in codesStrs) {
      final code = LangCode.safeValueOf(codeStr);
      if (code != null) {
        result.add(code);
      }
    }
    return result;
  }
}

// Source: https://wiki.openstreetmap.org/wiki/Nominatim/Country_Codes
const _COUNTRIES_LANG_CODES_TABLE = {
  'ad': ['ca'],
  'ae': ['ar'],
  'af': ['fa', 'ps'],
  'ag': ['en'],
  'ai': ['en'],
  'al': ['sq'],
  'am': ['hy'],
  'ao': ['pt'],
  'aq': ['en', 'es', 'fr', 'ru'],
  'ar': ['es'],
  'as': ['en', 'sm'],
  'at': ['de'],
  'au': ['en'],
  'aw': ['nl', 'pap'],
  'ax': ['sv'],
  'az': ['az'],
  'ba': ['bs', 'hr', 'sr'],
  'bb': ['en'],
  'bd': ['bn'],
  'be': ['nl', 'fr', 'de'],
  'bf': ['fr'],
  'bg': ['bg'],
  'bh': ['ar'],
  'bi': ['fr'],
  'bj': ['fr'],
  'bl': ['fr'],
  'bm': ['en'],
  'bn': ['ms'],
  'bo': ['es', 'qu', 'gn', 'ay'],
  'bq': ['nl'],
  'br': ['pt'],
  'bs': ['en'],
  'bt': ['dz'],
  'bv': ['no'],
  'bw': ['en', 'tn'],
  'by': ['be', 'ru'],
  'bz': ['en'],
  'ca': ['en', 'fr'],
  'cc': ['en'],
  'cd': ['fr'],
  'cf': ['fr', 'sg'],
  'cg': ['fr'],
  'ch': ['de', 'fr', 'it', 'rm'],
  'ci': ['fr'],
  'ck': ['en', 'rar'],
  'cl': ['es'],
  'cm': ['fr', 'en'],
  'cn': ['zh'],
  'co': ['es'],
  'cr': ['es'],
  'cu': ['es'],
  'cv': ['pt'],
  'cw': ['nl', 'en'],
  'cx': ['en'],
  'cy': ['el', 'tr'],
  'cz': ['cs'],
  'de': ['de'],
  'dj': ['fr', 'ar', 'so', 'aa'],
  'dk': ['da'],
  'dm': ['en'],
  'do': ['es'],
  'dz': ['ar'],
  'ec': ['es'],
  'ee': ['et'],
  'eg': ['ar'],
  'eh': ['ar', 'es', 'fr'],
  'er': ['ti', 'ar', 'en'],
  'es': ['ast', 'ca', 'es', 'eu', 'gl'],
  'et': ['am', 'om'],
  'fi': ['fi', 'sv', 'se'],
  'fj': ['en'],
  'fk': ['en'],
  'fm': ['en'],
  'fo': ['fo', 'da'],
  'fr': ['fr'],
  'ga': ['fr'],
  'gb': ['en', 'ga', 'cy', 'gd', 'kw'],
  'gd': ['en'],
  'ge': ['ka'],
  'gf': ['fr'],
  'gg': ['en'],
  'gh': ['en'],
  'gi': ['en'],
  'gl': ['kl', 'da'],
  'gm': ['en'],
  'gn': ['fr'],
  'gp': ['fr'],
  'gq': ['es', 'fr', 'pt'],
  'gr': ['el'],
  'gs': ['en'],
  'gt': ['es'],
  'gu': ['en', 'ch'],
  'gw': ['pt'],
  'gy': ['en'],
  'hk': ['zh', 'en'],
  'hm': ['en'],
  'hn': ['es'],
  'hr': ['hr'],
  'ht': ['fr', 'ht'],
  'hu': ['hu'],
  'id': ['id'],
  'ie': ['en', 'ga'],
  'il': ['he'],
  'im': ['en'],
  'in': ['hi', 'en'],
  'io': ['en'],
  'iq': ['ar', 'ku'],
  'ir': ['fa'],
  'is': ['is'],
  'it': ['it', 'de', 'fr'],
  'je': ['en'],
  'jm': ['en'],
  'jo': ['ar'],
  'jp': ['ja'],
  'ke': ['sw', 'en'],
  'kg': ['ky', 'ru'],
  'kh': ['km'],
  'ki': ['en'],
  'kk': ['kk'],
  'km': ['ar', 'fr', 'sw'],
  'kn': ['en'],
  'kp': ['ko'],
  'kr': ['ko', 'en'],
  'kw': ['ar'],
  'ky': ['en'],
  'kz': ['kk', 'ru'],
  'la': ['lo'],
  'lb': ['ar', 'fr'],
  'lc': ['en'],
  'li': ['de'],
  'lk': ['si', 'ta'],
  'lr': ['en'],
  'ls': ['en', 'st'],
  'lt': ['lt'],
  'lu': ['lb', 'fr', 'de'],
  'lv': ['lv'],
  'ly': ['ar'],
  'ma': ['fr', 'zgh', 'ar'],
  'mc': ['fr'],
  'md': ['ro', 'ru', 'uk'],
  'me': ['srp', 'sr', 'hr', 'bs', 'sq'],
  'mf': ['fr'],
  'mg': ['mg', 'fr'],
  'mh': ['en', 'mh'],
  'mk': ['mk'],
  'ml': ['fr'],
  'mm': ['my'],
  'mn': ['mn'],
  'mo': ['zh', 'pt'],
  'mp': ['en', 'ch'],
  'mq': ['fr'],
  'mr': ['ar', 'fr'],
  'ms': ['en'],
  'mt': ['mt', 'en'],
  'mu': ['mfe', 'fr', 'en'],
  'mv': ['dv'],
  'mw': ['en', 'ny'],
  'mx': ['es'],
  'my': ['ms'],
  'mz': ['pt'],
  'na': ['en', 'sf', 'de'],
  'nc': ['fr'],
  'ne': ['fr'],
  'nf': ['en', 'pih'],
  'ng': ['en'],
  'ni': ['es'],
  'nl': ['nl'],
  'no': ['nb', 'nn', 'no', 'se'],
  'np': ['ne'],
  'nr': ['na', 'en'],
  'nu': ['niu', 'en'],
  'nz': ['mi', 'en'],
  'om': ['ar'],
  'pa': ['es'],
  'pe': ['es'],
  'pf': ['fr'],
  'pg': ['en', 'tpi', 'ho'],
  'ph': ['en', 'tl'],
  'pk': ['en', 'ur'],
  'pl': ['pl'],
  'pm': ['fr'],
  'pn': ['en', 'pih'],
  'pr': ['es', 'en'],
  'ps': ['ar', 'he'],
  'pt': ['pt'],
  'pw': ['en', 'pau', 'ja', 'sov', 'tox'],
  'py': ['es', 'gn'],
  'qa': ['ar'],
  're': ['fr'],
  'ro': ['ro'],
  'rs': ['sr'],
  'ru': ['ru'],
  'rw': ['rw', 'fr', 'en'],
  'sa': ['ar'],
  'sb': ['en'],
  'sc': ['fr', 'en', 'crs'],
  'sd': ['ar', 'en'],
  'se': ['sv'],
  'sg': ['zh', 'en', 'ms', 'ta'],
  'sh': ['en'],
  'si': ['sl'],
  'sj': ['no'],
  'sk': ['sk'],
  'sl': ['en'],
  'sm': ['it'],
  'sn': ['fr'],
  'so': ['so', 'ar'],
  'sr': ['nl'],
  'st': ['pt'],
  'ss': ['en'],
  'sv': ['es'],
  'sx': ['nl', 'en'],
  'sy': ['ar'],
  'sz': ['en', 'ss'],
  'tc': ['en'],
  'td': ['fr', 'ar'],
  'tf': ['fr'],
  'tg': ['fr'],
  'th': ['th'],
  'tj': ['tg', 'ru'],
  'tk': ['tkl', 'en', 'sm'],
  'tl': ['pt', 'tet'],
  'tm': ['tk'],
  'tn': ['ar', 'fr'],
  'to': ['en'],
  'tr': ['tr'],
  'tt': ['en'],
  'tv': ['en'],
  'tw': ['zh'],
  'tz': ['sw', 'en'],
  'ua': ['uk'],
  'ug': ['en', 'sw'],
  'um': ['en'],
  'us': ['en'],
  'uy': ['es'],
  'uz': ['uz', 'kaa'],
  'va': ['it'],
  'vc': ['en'],
  've': ['es'],
  'vg': ['en'],
  'vi': ['en'],
  'vn': ['vi'],
  'vu': ['bi', 'en', 'fr'],
  'wf': ['fr'],
  'ws': ['sm', 'en'],
  'ye': ['ar'],
  'yt': ['fr'],
  'za': ['en', 'af', 'st', 'tn', 'xh', 'zu'],
  'zm': ['en'],
  'zw': ['en', 'sn', 'nd'],
};
