<?php
/**
 * SAML 2.0 remote IdP metadata for SimpleSAMLphp.
 *
 * Remember to remove the IdPs you don't use from this file.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-remote 
 */

/*
 * Guest IdP. allows users to sign up and register. Great for testing!
 */

/*
 * $metadata['https://openidp.feide.no'] = array(
	'name' => array(
		'en' => 'Feide OpenIdP - guest users',
		'no' => 'Feide Gjestebrukere',
	),
	'description'          => 'Here you can login with your account on Feide RnD OpenID. If you do not already have an account on this identity provider, you can create a new one by following the create new account link and follow the instructions.',

	'SingleSignOnService'  => 'https://openidp.feide.no/simplesaml/saml2/idp/SSOService.php',
	'SingleLogoutService'  => 'https://openidp.feide.no/simplesaml/saml2/idp/SingleLogoutService.php',
	'certFingerprint'      => 'c9ed4dfb07caf13fc21e0fec1572047eb8a7a4cb'
);
*/

/*
$metadata['https://idp.feide.no'] = array (
  'metadata-set' => 'saml20-idp-remote',
  'entityid' => 'https://idp.feide.no',
  'name' => array('en' => 'Norwegian Feide Federation'),
  'SingleSignOnService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp.feide.no/simplesaml/saml2/idp/SSOService.php',
    ),
  ),
  'SingleLogoutService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp.feide.no/simplesaml/saml2/idp/SingleLogoutService.php',
    ),
  ),
  'certData' => 'MIIDhjCCAm4CCQCZwrMQOJ3URzANBgkqhkiG9w0BAQUFADCBhDELMAkGA1UEBhMCTk8xEjAQBgNVBAcTCVRyb25kaGVpbTETMBEGA1UEChMKVW5pbmV0dCBBUzEOMAwGA1UECxMFRkVJREUxFTATBgNVBAMTDGlkcC5mZWlkZS5ubzElMCMGCSqGSIb3DQEJARYWbW9yaWEtZHJpZnRAdW5pbmV0dC5ubzAeFw0xNDA0MTEwOTM1MTBaFw0zNDA0MTEwOTM1MTBaMIGEMQswCQYDVQQGEwJOTzESMBAGA1UEBxMJVHJvbmRoZWltMRMwEQYDVQQKEwpVbmluZXR0IEFTMQ4wDAYDVQQLEwVGRUlERTEVMBMGA1UEAxMMaWRwLmZlaWRlLm5vMSUwIwYJKoZIhvcNAQkBFhZtb3JpYS1kcmlmdEB1bmluZXR0Lm5vMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr3UtSny6D+DRQzdjWOdd+eQZxa9aKrx/v70Uo+yvnzgenLLS+MsUxbiSLkAPIbkWOO2kLdG9XSZ9sp9S5aGYMnsarxeGEXV1AS6olrpo5QJOZoQStFB0dYEXzBSJifTIsEmyXByd8mE64dkMcdzG90eBzfcFNwU6vKjln0vmoDocJrKZvUoF7d1egD+aUa9o3BneMDylcp8mkCe6XcnPlJ8QqxQ/RBmaly/Hl/zTZei8+pEu7ICRiorD2iHEDM/EhsclOrMKiRFBuZN8yB4sgknhdmAiWRyB/D4CEj74MQDQPp7Mr1B0Vxn7Y7ZeStt19HxEjzxyJGsdC9BMrn+tzwIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQBwZmzNzTgbYAuQGikkRbKInog5OCMo3GhZO82+IrtasJC6rNPrz/+8KHfIOUB83wnfEMnKKygW7ELeSnvlbKUyve6DbNXrHjMJYzjqLG3cdgIKZaFyTfWaQiY8G82qP38Lc7rtgLoh/F7lpqCdunzPfSQBraGH2IAHyP6x3tjlsGGTj/LN8sT20iHRk8IXsBsMGv5DcZ4n+zB2E5hyfxH87sNYu6gaIrpcxcv5N0AK++fvpnrhlEmT0rW7b8wgBB4BmaPfCCb4DbDgHvIBPmG8QF7SNjUGuVPUFJRPTkvhighbeuRtoNpq0W1EVXKq0ZeBO8jJ6Si9LAdFvqwy70D0',
  'NameIDFormat' => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
  'OrganizationName' => 
  array (
    'en' => 'Feide',
    'no' => 'Feide',
  ),
  'OrganizationDisplayName' => 
  array (
    'en' => 'Feide - Norwegian educational institutions',
    'no' => 'Feide - Norske utdanningsinstitusjoner',
  ),
  'OrganizationURL' => 
  array (
    'en' => 'http://www.feide.no/introducing-feide',
    'no' => 'http://www.feide.no/',
  ),
);

*/

$metadata['https://idp-test.feide.no'] = array (
  'metadata-set' => 'saml20-idp-remote',
  'entityid' => 'https://idp-test.feide.no',
  'SingleSignOnService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp-test.feide.no/simplesaml/saml2/idp/SSOService.php',
    ),
  ),
  'SingleLogoutService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp-test.feide.no/simplesaml/saml2/idp/SingleLogoutService.php',
    ),
  ),
  'certData' => 'MIIDkDCCAngCCQCLL8NWusxhbzANBgkqhkiG9w0BAQUFADCBiTELMAkGA1UEBhMCTk8xEjAQBgNVBAcTCVRyb25kaGVpbTETMBEGA1UEChMKVW5pbmV0dCBBUzEOMAwGA1UECxMFRkVJREUxGjAYBgNVBAMTEWlkcC10ZXN0LmZlaWRlLm5vMSUwIwYJKoZIhvcNAQkBFhZtb3JpYS1kcmlmdEB1bmluZXR0Lm5vMB4XDTE0MDQxMTEwMjkxMloXDTM0MDQxMTEwMjkxMlowgYkxCzAJBgNVBAYTAk5PMRIwEAYDVQQHEwlUcm9uZGhlaW0xEzARBgNVBAoTClVuaW5ldHQgQVMxDjAMBgNVBAsTBUZFSURFMRowGAYDVQQDExFpZHAtdGVzdC5mZWlkZS5ubzElMCMGCSqGSIb3DQEJARYWbW9yaWEtZHJpZnRAdW5pbmV0dC5ubzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMFL8ZFo/E42mPw4r27+HVn54E0ltmb88q1MsfGyiRlaEvVdnIo81tTUonjG4EP58wz/bQ49dSPOOoNVZ4NkhU2G4x81XErqEGFw31NBQerXp0Gcs8A93aIVGluKfCW5kDZtV+WnE0P2trwyPS5vKTVvs4MvIoDrGoWRT0y2ok9xzv5nxbICrSzsnBTC5rMrKFgKeaoappnZHt3isttfVZSP3aidmHEbl2Hw7xci554woRjx7n2kOxgOUa8A49HqV7Sr9lZDyffusOZ8QRBjongfBOgNGcrkyxXjI9xs1dD9ZKrwlORNx54kP9/rpHe+drXCV9QvR6zNrxHnxbEuWiUCAwEAATANBgkqhkiG9w0BAQUFAAOCAQEAFOsehLFueCFZqVOua+Uc81amKA+ZWHkvZWOavCsfzozZSLH4gGtwzMA1/6bh+FhURB+QdIiglH9EUDWWItaC8SCvhDo87v3bzg+LT8AE9go8mI15AraZAF6XwJC6r23UOsHcn68GLuDF+om8slizTTec6aQtA9qkhMLSwMarvk1S3m8KZEVOcghB9cpgyt3otz0JbiOmfIDoetbNeEa/x6sLXi9il/H5mtEmJUhdB6YjKaIPtMiILr1ow7DaHmJGgt+qyr09rZXOCz3okDko6WRCGCw5EdgDuYwiHz4xtixLhBvY5TKqIwgKAhNYKRxO6C4ugrS/ToCgC0j1epeK6A==',
  'NameIDFormat' => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
  'OrganizationName' => 
  array (
    'en' => 'Feide',
    'no' => 'Feide',
  ),
  'OrganizationDisplayName' => 
  array (
    'en' => 'Feide - Norwegian educational institutions (test-IdP)',
    'no' => 'Feide - Norske utdanningsinstitusjoner (test-IdP)',
  ),
  'OrganizationURL' => 
  array (
    'en' => 'http://www.feide.no/introducing-feide',
    'no' => 'http://www.feide.no/',
  ),
  'scope' => 
  array (
    0 => 'feide.no',
    1 => 'spusers.feide.no',
    2 => 'uninett.no',
    3 => 'agdenes.kommune.no',
    4 => 'aho.no',
    5 => 'feide.akademiet.no',
    6 => 'alstahaug.kommune.no',
    7 => 'alvdal.kommune.no',
    8 => 'andebu.kommune.no',
    9 => 'ansgarhogskole.no',
    10 => 'aremark.kommune.no',
    11 => 'arendal.kommune.no',
    12 => 'asker.kommune.no',
    13 => 'askim.kommune.no',
    14 => 'askoy.kommune.no',
    15 => 'askvoll.kommune.no',
    16 => 'audnedal.kommune.no',
    17 => 'aure.kommune.no',
    18 => 'aurland.kommune.no',
    19 => 'austagderfk.no',
    20 => 'austevoll.kommune.no',
    21 => 'austrheim.kommune.no',
    22 => 'averoy.kommune.no',
    23 => 'balestrand.kommune.no',
    24 => 'balsfjord.kommune.no',
    25 => 'bamble.kommune.no',
    26 => 'bardu.kommune.no',
    27 => 'bkgs.no',
    28 => 'bergensskolen.no',
    29 => 'berlevag.kommune.no',
    30 => 'betanien.no',
    31 => 'bfk.no',
    32 => 'bi.no',
    33 => 'bibsys.no',
    34 => 'birkenes.kommune.no',
    35 => 'bjerkreim.kommune.no',
    36 => 'blakors.no',
    37 => 'bo.kommune.no',
    38 => 'bodo.kommune.no',
    39 => 'boe.kommune.no',
    40 => 'bokn.kommune.no',
    41 => 'bomlo.kommune.no',
    42 => 'bremanger.kommune.no',
    43 => 'bronnoy.kommune.no',
    44 => 'baerum.kommune.no',
    45 => 'bygland.kommune.no',
    46 => 'bykle.kommune.no',
    47 => 'cmi.no',
    48 => 'danielsen-skoler.no',
    49 => 'delk.no',
    50 => 'diakonhjemmet.no',
    51 => 'diakonova.no',
    52 => 'dmmh.no',
    53 => 'dovreskulane.no',
    54 => 'drammen.kommune.no',
    55 => 'donna.kommune.no',
    56 => 'dvm.iktsenteret.no',
    57 => 'e-h.kommune.no',
    58 => 'eid.kommune.no',
    59 => 'eide.kommune.no',
    60 => 'eidfjord.kommune.no',
    61 => 'eidsberg.kommune.no',
    62 => 'eidskog.kommune.no',
    63 => 'eidsvoll.kommune.no',
    64 => 'eigersund.kommune.no',
    65 => 'ekrehagen.no',
    66 => 'elverum.kommune.no',
    67 => 'enebakk.kommune.no',
    68 => 'etne.kommune.no',
    69 => 'etnedal.kommune.no',
    70 => 'evenes.kommune.no',
    71 => 'fagerhaugoppvekst.no',
    72 => 'fauske.kommune.no',
    73 => 'fedje.kommune.no',
    74 => 'feide.ahk.no',
    75 => 'feide.amot.kommune.no',
    76 => 'feide.aukra.kommune.no',
    77 => 'feide.bjugn.kommune.no',
    78 => 'feide.engerdal.kommune.no',
    79 => 'feide.egms.no',
    80 => 'feide.farsund.kommune.no',
    81 => 'feide.heltberg.no',
    82 => 'feide.kg.vgs.no',
    83 => 'feide.leksvik.kommune.no',
    84 => 'feide.levanger.kommune.no',
    85 => 'feide.lorenskog-skole.no',
    86 => 'feide.lund.kommune.no',
    87 => 'feide.molde.kommune.no',
    88 => 'feide.mosseskolen.no',
    89 => 'feide.nlm.no',
    90 => 'feide.oknett.no',
    91 => 'feide.orkdal.kommune.no',
    92 => 'feide.osen.kommune.no',
    93 => 'feide.osloskolen.no',
    94 => 'feide.osloskolefat.no',
    95 => 'feide.osloskoletest.no',
    96 => 'feide.rade.kommune.no',
    97 => 'feide.ringerike.kommune.no',
    98 => 'feide.rissa.kommune.no',
    99 => 'feide.roan.kommune.no',
    100 => 'feide.rygge.kommune.no',
    101 => 'feide.skedsmo.no',
    102 => 'feide.stor-elvdal.kommune.no',
    103 => 'feide.stord.kommune.no',
    104 => 'feide.trysil.kommune.no',
    105 => 'feide.verdal.kommune.no',
    106 => 'feide.vestnes.kommune.no',
    107 => 'feide.afjord.kommune.no',
    108 => 'fet.kommune.no',
    109 => 'ffk.vgs.no',
    110 => 'fhs.mil.no',
    111 => 'fitjar.kommune.no',
    112 => 'fjaler.kommune.no',
    113 => 'fjell.kommune.no',
    114 => 'fjellhaug.no',
    115 => 'flesberg.kommune.no',
    116 => 'flaa.kommune.no',
    117 => 'flatanger.kommune.no',
    118 => 'flekkefjord.kommune.no',
    119 => 'flora.kommune.no',
    120 => 'folkeuniversitetet.no',
    121 => 'folldal.kommune.no',
    122 => 'forde.kommune.no',
    123 => 'forsand.kommune.no',
    124 => 'forskningsradet.no',
    125 => 'fosnes.kommune.no',
    126 => 'fossumkollektivet.no',
    127 => 'skole.fredrikstad.no',
    128 => 'framnes.vgs.no',
    129 => 'frana.kommune.no',
    130 => 'friskolen.no',
    131 => 'frogn.kommune.no',
    132 => 'froland.kommune.no',
    133 => 'frosta.kommune.no',
    134 => 'froya.kommune.no',
    135 => 'fusa.kommune.no',
    136 => 'fyresdal.kommune.no',
    137 => 'gausdal.kommune.no',
    138 => 'gaular.kommune.no',
    139 => 'giske.kommune.no',
    140 => 'gjemnes.kommune.no',
    141 => 'gjerdrum.kommune.no',
    142 => 'gjesdal.kommune.no',
    143 => 'gjovik.kommune.no',
    144 => 'gloppen.kommune.no',
    145 => 'gol.kommune.no',
    146 => 'gran.kommune.no',
    147 => 'grane.kommune.no',
    148 => 'granvin.kommune.no',
    149 => 'gratangen.kommune.no',
    150 => 'grimstad.kommune.no',
    151 => 'grue.kommune.no',
    152 => 'grong.kommune.no',
    153 => 'gs.alesund.kommune.no',
    154 => 'gs.haram.kommune.no',
    155 => 'gs.skodje.kommune.no',
    156 => 'gs.sula.kommune.no',
    157 => 'gulen.kommune.no',
    158 => 'hadsel.kommune.no',
    159 => 'haldenskole.no',
    160 => 'halsa.kommune.no',
    161 => 'hamar.kommune.no',
    162 => 'hammerfest.kommune.no',
    163 => 'feide.harstad.kommune.no',
    164 => 'haugesund.kommune.no',
    165 => 'haraldsplass.no',
    166 => 'hasvik.kommune.no',
    167 => 'hattfjelldal.kommune.no',
    168 => 'hbv.no',
    169 => 'hedmark.org',
    170 => 'hemne.kommune.no',
    171 => 'hemnes.kommune.no',
    172 => 'hemsedal.kommune.no',
    173 => 'heroy-no.kommune.no',
    174 => 'heroy.kommune.no',
    175 => 'hitra.kommune.no',
    176 => 'hjartdal.kommune.no',
    177 => 'hfk.no',
    178 => 'hials.no',
    179 => 'hib.no',
    180 => 'hig.no',
    181 => 'hih.no',
    182 => 'hihm.no',
    183 => 'hil.no',
    184 => 'himolde.no',
    185 => 'hin.no',
    186 => 'hinesna.no',
    187 => 'hint.no',
    188 => 'hioa.no',
    189 => 'hiof.no',
    190 => 'hisf.no',
    191 => 'hjelmeland.kommune.no',
    192 => 'hsh.no',
    193 => 'hist.no',
    194 => 'hit.no',
    195 => 'hivolda.no',
    196 => 'hobol.kommune.no',
    197 => 'hol.kommune.no',
    198 => 'hof.kommune.no',
    199 => 'holeskolen.no',
    200 => 'holmestrand.kommune.no',
    201 => 'feide.holtalen.kommune.no',
    202 => 'hornindal.kommune.no',
    203 => 'horten.kommune.no',
    204 => 'hurdal.kommune.no',
    205 => 'hurum.kommune.no',
    206 => 'hoyanger.kommune.no',
    207 => 'hoylandet.kommune.no',
    208 => 'ha.kommune.no',
    209 => 'hvl.no',
    210 => 'hvaler.kommune.no',
    211 => 'hyllestad.kommune.no',
    212 => 'haegebostad.kommune.no',
    213 => 'iktsenteret.no',
    214 => 'inderoy.kommune.no',
    215 => 'innfjorden.no',
    216 => 'iveland.kommune.no',
    217 => 'jolster.kommune.no',
    218 => 'jondal.kommune.no',
    219 => 'jaertun.no',
    220 => 'kafjord.kommune.no',
    221 => 'karasjok.kommune.no',
    222 => 'karlsoy.kommune.no',
    223 => 'kautokeino.kommune.no',
    224 => 'khib.no',
    225 => 'khio.no',
    226 => 'karmoyskolen.no',
    227 => 'klepp.kommune.no',
    228 => 'klabu.kommune.no',
    229 => 'kongsberg.kommune.no',
    230 => 'kongsvinger.kommune.no',
    231 => 'kragero.kommune.no',
    232 => 'kristiansand.kommune.no',
    233 => 'kristiansund.kommune.no',
    234 => 'kvam.kommune.no',
    235 => 'kvafjord.kommune.no',
    236 => 'kvinnherad.kommune.no',
    237 => 'kvinesdal.kommune.no',
    238 => 'kvn.no',
    239 => 'kvalsund.kommune.no',
    240 => 'kvanangen.kommune.no',
    241 => 'lardal.kommune.no',
    242 => 'larvik.kommune.no',
    243 => 'lavangen.kommune.no',
    244 => 'ldh.no',
    245 => 'leikanger.kommune.no',
    246 => 'leirfjord.kommune.no',
    247 => 'lenvik.kommune.no',
    248 => 'lesjaskulane.no',
    249 => 'lier.kommune.no',
    250 => 'lierne.kommune.no',
    251 => 'lillehammer.kommune.no',
    252 => 'lillesand.kommune.no',
    253 => 'lindas.kommune.no',
    254 => 'lindesnes.kommune.no',
    255 => 'lomskulane.no',
    256 => 'loppa.kommune.no',
    257 => 'loten.kommune.no',
    258 => 'lunner.kommune.no',
    259 => 'luster.kommune.no',
    260 => 'lybskole.no',
    261 => 'lyngen.kommune.no',
    262 => 'lyngdal.kommune.no',
    263 => 'malselv.kommune.no',
    264 => 'malvik.kommune.no',
    265 => 'mandal.kommune.no',
    266 => 'marker.kommune.no',
    267 => 'marnardal.kommune.no',
    268 => 'masfjorden.kommune.no',
    269 => 'masoy.kommune.no',
    270 => 'meland.kommune.no',
    271 => 'melhus.kommune.no',
    272 => 'meraker.kommune.no',
    273 => 'met.no',
    274 => 'metisutdanning.no',
    275 => 'mf.no',
    276 => 'midtre-gauldal.kommune.no',
    277 => 'mhs.no',
    278 => 'feide.midsund.kommune.no',
    279 => 'modalen.kommune.no',
    280 => 'modum.kommune.no',
    281 => 'mrfylke.no',
    282 => 'namdalseid.kommune.no',
    283 => 'namsos.kommune.no',
    284 => 'namsskogan.kommune.no',
    285 => 'nannestad.kommune.no',
    286 => 'narvik.kommune.no',
    287 => 'nb.no',
    288 => 'naustdal.kommune.no',
    289 => 'nedre-eiker.kommune.no',
    290 => 'nes-ak.kommune.no',
    291 => 'nes-bu.kommune.no',
    292 => 'feide.nesodden.kommune.no',
    293 => 'nesseby.kommune.no',
    294 => 'nesset.kommune.no',
    295 => 'nfk.no',
    296 => 'ngu.no',
    297 => 'nhh.no',
    298 => 'nhkg.no',
    299 => 'nih.no',
    300 => 'nifu.no',
    301 => 'nissedal.kommune.no',
    302 => 'nla.no',
    303 => 'nmbu.no',
    304 => 'nmh.no',
    305 => 'nome.kommune.no',
    306 => 'nord.no',
    307 => 'nord-aurdal.kommune.no',
    308 => 'nord-odal.kommune.no',
    309 => 'feide.nord-fron.kommune.no',
    310 => 'nordkapp.kommune.no',
    311 => 'nordreisa.kommune.no',
    312 => 'nore-og-uvdal.kommune.no',
    313 => 'ntg.no',
    314 => 'notodden.kommune.no',
    315 => 'notteroy.kommune.no',
    316 => 'ntfk.no',
    317 => 'naroy.kommune.no',
    318 => 'ntnu.no',
    319 => 'oddaskolen.no',
    320 => 'oks.no',
    321 => 'oksnes.kommune.no',
    322 => 'oppdal.kommune.no',
    323 => 'oppland.org',
    324 => 'gs.orskog.kommune.no',
    325 => 'orsta.kommune.no',
    326 => 'os-ho.kommune.no',
    327 => 'osteroy.kommune.no',
    328 => 'ostre-toten.kommune.no',
    329 => 'overhalla.kommune.no',
    330 => 'ovgs.no',
    331 => 'ovre-eiker.kommune.no',
    332 => 'oygarden.kommune.no',
    333 => 'oystre-slidre.kommune.no',
    334 => 'phs.no',
    335 => 'porsanger.kommune.no',
    336 => 'porsgrunn.kommune.no',
    337 => 'radoy.kommune.no',
    338 => 'ralingen.kommune.no',
    339 => 'rakkestad.kommune.no',
    340 => 'rana.kommune.no',
    341 => 'randaberg.kommune.no',
    342 => 'feide.rauma.kommune.no',
    343 => 're.kommune.no',
    344 => 'rendalen.kommune.no',
    345 => 'rennebu.kommune.no',
    346 => 'rennesoy.kommune.no',
    347 => 'ringebu.kommune.no',
    348 => 'rindal.kommune.no',
    349 => 'ringsaker.kommune.no',
    350 => 'rodoy.kommune.no',
    351 => 'rogfk.no',
    352 => 'rollag.kommune.no',
    353 => 'romskog.kommune.no',
    354 => 'feide.roros.kommune.no',
    355 => 'royken.kommune.no',
    356 => 'royrvik.kommune.no',
    357 => 'salangen.kommune.no',
    358 => 'saltdal.kommune.no',
    359 => 'samfunnsforskning.no',
    360 => 'samiskhs.no',
    361 => 'sami.vgs.no',
    362 => 'samisk.vgs.no',
    363 => 'samnanger.kommune.no',
    364 => 'sande.kommune.no',
    365 => 'sandefjord.kommune.no',
    366 => 'sandefjordskolen.no',
    367 => 'sandnes.kommune.no',
    368 => 'feide.sarpsborg.com',
    369 => 'sauda.kommune.no',
    370 => 'sauherad.kommune.no',
    371 => 'seiersborg.vgs.no',
    372 => 'selbu.kommune.no',
    373 => 'selje.kommune.no',
    374 => 'seljord.kommune.no',
    375 => 'selskolene.no',
    376 => 'sigdal.kommune.no',
    377 => 'sintef.no',
    378 => 'feide.ski.kommune.no',
    379 => 'sfj.no',
    380 => 'siu.no',
    381 => 'skanland.kommune.no',
    382 => 'skaun.kommune.no',
    383 => 'skiptvet.kommune.no',
    384 => 'skjaakskulane.no',
    385 => 'skjervoy.kommune.no',
    386 => 'skole.svk.no',
    387 => 'skoler.alta.no',
    388 => 'smola.kommune.no',
    389 => 'snillfjord.kommune.no',
    390 => 'snasa.kommune.no',
    391 => 'sogne.kommune.no',
    392 => 'sogndal.kommune.no',
    393 => 'songdalen.kommune.no',
    394 => 'sola.kommune.no',
    395 => 'solund.kommune.no',
    396 => 'sonans.no',
    397 => 'sor-aurdal.kommune.no',
    398 => 'sortland.kommune.no',
    399 => 'sor-fron.kommune.no',
    400 => 'sor-odal.kommune.no',
    401 => 'sorum.kommune.no',
    402 => 'spydeberg.kommune.no',
    403 => 'stange.kommune.no',
    404 => 'stavanger.kommune.no',
    405 => 'stpaul.no',
    406 => 'steinkjer.kommune.no',
    407 => 'stfk.no',
    408 => 'stjordal.kommune.no',
    409 => 'stokke.kommune.no',
    410 => 'storfjord.kommune.no',
    411 => 'strand.kommune.no',
    412 => 'feide.stranda.kommune.no',
    413 => 'stryn.kommune.no',
    414 => 'suldal.kommune.no',
    415 => 'sund.kommune.no',
    416 => 'sunndal.kommune.no',
    417 => 'surnadal.kommune.no',
    418 => 'sveio.kommune.no',
    419 => 'svelvik.kommune.no',
    420 => 'tana.kommune.no',
    421 => 't-fk.no',
    422 => 'time.kommune.no',
    423 => 'tingvoll.kommune.no',
    424 => 'tinn.kommune.no',
    425 => 'tjome.kommune.no',
    426 => 'tokke.kommune.no',
    427 => 'tolga.kommune.no',
    428 => 'tomb.no',
    429 => 'tonsberg.kommune.no',
    430 => 'toppidrettsgymnaset.no',
    431 => 'torsken.kommune.no',
    432 => 'trogstad.kommune.no',
    433 => 'troms.vgs.no',
    434 => 'tromso.kommune.no',
    435 => 'trondheim.kommune.no',
    436 => 'tydal.kommune.no',
    437 => 'tynset.kommune.no',
    438 => 'tysnes.kommune.no',
    439 => 'tysver.kommune.no',
    440 => 'uhr.no',
    441 => 'uia.no',
    442 => 'uib.no',
    443 => 'uin.no',
    444 => 'uio.no',
    445 => 'uis.no',
    446 => 'uit.no',
    447 => 'ullensvang.herad.no',
    448 => 'ulstein.kommune.no',
    449 => 'ulvik.kommune.no',
    450 => 'ullensaker.kommune.no',
    451 => 'unis.no',
    452 => 'usn.no',
    453 => 'utsira.kommune.no',
    454 => 'vagan.kommune.no',
    455 => 'vaga.kommune.no',
    456 => 'vaalerskolene.no',
    457 => 'valer-of.kommune.no',
    458 => 'valle.kommune.no',
    459 => 'vagsoy.kommune.no',
    460 => 'vaksdal.kommune.no',
    461 => 'vanylven.kommune.no',
    462 => 'vang.kommune.no',
    463 => 'vatneli.no',
    464 => 'vefsn.kommune.no',
    465 => 'vennesla.kommune.no',
    466 => 'verran.kommune.no',
    467 => 'vestby.kommune.no',
    468 => 'vestre-slidre.kommune.no',
    469 => 'vestre-toten.kommune.no',
    470 => 'vestvagoy.kommune.no',
    471 => 'vfk.no',
    472 => 'vgsa.no',
    473 => 'vaf.no',
    474 => 'vid.no',
    475 => 'vik.kommune.no',
    476 => 'vindafjord.kommune.no',
    477 => 'vinje.kommune.no',
    478 => 'voss.kommune.no',
    479 => 'wang.no',
    480 => 'westerdals.no',
    481 => 'oya.vgs.no',
    482 => 'oyer.kommune.no',
    483 => 'aal.kommune.no',
    484 => 'as-skole.no',
    485 => 'aseral.kommune.no',
    486 => 'asnes.kommune.no',
  ),
  'contacts' => 
  array (
    0 => 
    array (
      'emailAddress' => 'moria-drift@uninett.no',
      'contactType' => 'technical',
      'givenName' => 'Feide',
      'surName' => 'Support',
    ),
  ),
);
