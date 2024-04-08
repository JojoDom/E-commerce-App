// To parse this JSON data, do
//
//     final extractImageResponseFull = extractImageResponseFullFromJson(jsonString);

import 'dart:convert';

ExtractImageResponseFull extractImageResponseFullFromJson(String str) => ExtractImageResponseFull.fromJson(json.decode(str));

String extractImageResponseFullToJson(ExtractImageResponseFull data) => json.encode(data.toJson());

class ExtractImageResponseFull {
    String status;
    String id;
    List<Document> documents;

    ExtractImageResponseFull({
        required this.status,
        required this.id,
        required this.documents,
    });

    factory ExtractImageResponseFull.fromJson(Map<String, dynamic> json) => ExtractImageResponseFull(
        status: json["status"],
        id: json["id"],
        documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    };
}

class Document {
    String id;
    String type;
    String version;
    List<Page> pages;
    DateOfBirthDateDeNaissance nationalityNationalite;
    DateOfBirthDateDeNaissance firstnamesPrnoms;
    DateOfBirthDateDeNaissance sexSexe;
    DateOfBirthDateDeNaissance dateOfExpiryDateDexpiration;
    DateOfBirthDateDeNaissance personalIdNumber;
    DateOfBirthDateDeNaissance surnameNom;
    DateOfBirthDateDeNaissance dateOfIssuanceDateDemission;
    DateOfBirthDateDeNaissance heighutAillem;
    DateOfBirthDateDeNaissance dateOfBirthDateDeNaissance;
    DateOfBirthDateDeNaissance placeOfIssuanceLieuDeDelivRance;
   
    

    Document({
        required this.id,
        required this.type,
        required this.version,
        required this.pages,
        required this.nationalityNationalite,
        required this.firstnamesPrnoms,
        required this.sexSexe,
        required this.dateOfExpiryDateDexpiration,
        required this.personalIdNumber,
        required this.surnameNom,
        required this.dateOfIssuanceDateDemission,
        required this.heighutAillem,
        required this.dateOfBirthDateDeNaissance,
        required this.placeOfIssuanceLieuDeDelivRance,
    });

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        type: json["type"],
        version: json["version"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
        nationalityNationalite: DateOfBirthDateDeNaissance.fromJson(json["nationalityNationalite"]),
        firstnamesPrnoms: DateOfBirthDateDeNaissance.fromJson(json["firstnamesPrénoms"]),
        sexSexe: DateOfBirthDateDeNaissance.fromJson(json["sexSexe"]),
        dateOfExpiryDateDexpiration: DateOfBirthDateDeNaissance.fromJson(json["dateOfExpiryDateDexpiration"]),
        personalIdNumber: DateOfBirthDateDeNaissance.fromJson(json["personalIDNumber"]),
        surnameNom: DateOfBirthDateDeNaissance.fromJson(json["surnameNom"]),
        dateOfIssuanceDateDemission: DateOfBirthDateDeNaissance.fromJson(json["dateOfIssuanceDateDemission"]),
        heighutAillem: DateOfBirthDateDeNaissance.fromJson(json["heighutAillem"]),
        dateOfBirthDateDeNaissance: DateOfBirthDateDeNaissance.fromJson(json["dateOfBirthDateDeNaissance"]),
        placeOfIssuanceLieuDeDelivRance: DateOfBirthDateDeNaissance.fromJson(json["placeOfIssuanceLieuDeDelivRance"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "version": version,
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
        "nationalityNationalite": nationalityNationalite.toJson(),
        "firstnamesPrénoms": firstnamesPrnoms.toJson(),
        "sexSexe": sexSexe.toJson(),
        "dateOfExpiryDateDexpiration": dateOfExpiryDateDexpiration.toJson(),
        "personalIDNumber": personalIdNumber.toJson(),
        "surnameNom": surnameNom.toJson(),
        "dateOfIssuanceDateDemission": dateOfIssuanceDateDemission.toJson(),
        "heighutAillem": heighutAillem.toJson(),
        "dateOfBirthDateDeNaissance": dateOfBirthDateDeNaissance.toJson(),
        "placeOfIssuanceLieuDeDelivRance": placeOfIssuanceLieuDeDelivRance.toJson(),
    };
}

class DateOfBirthDateDeNaissance {
    Type type;
    String value;

    DateOfBirthDateDeNaissance({
        required this.type,
        required this.value,
    });

    factory DateOfBirthDateDeNaissance.fromJson(Map<String, dynamic> json) => DateOfBirthDateDeNaissance(
        type: typeValues.map[json["type"]]!,
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "value": value,
    };
}

enum Type {
    STRING
}

final typeValues = EnumValues({
    "string": Type.STRING
});

class Page {
    int fileIdx;
    int offset;
    int count;

    Page({
        required this.fileIdx,
        required this.offset,
        required this.count,
    });

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        fileIdx: json["fileIdx"],
        offset: json["offset"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "fileIdx": fileIdx,
        "offset": offset,
        "count": count,
    };
}

class TextAnnotation {
    List<PageElement> pages;

    TextAnnotation({
        required this.pages,
    });

    factory TextAnnotation.fromJson(Map<String, dynamic> json) => TextAnnotation(
        pages: List<PageElement>.from(json["Pages"].map((x) => PageElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Pages": List<dynamic>.from(pages.map((x) => x.toJson())),
    };
}

class PageElement {
    double clockwiseOrientation;
    List<Word> words;

    PageElement({
        required this.clockwiseOrientation,
        required this.words,
    });

    factory PageElement.fromJson(Map<String, dynamic> json) => PageElement(
        clockwiseOrientation: json["ClockwiseOrientation"]?.toDouble(),
        words: List<Word>.from(json["Words"].map((x) => Word.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ClockwiseOrientation": clockwiseOrientation,
        "Words": List<dynamic>.from(words.map((x) => x.toJson())),
    };
}

class Word {
    String id;
    String text;
    List<double> outline;
    double confidence;
    Lang lang;

    Word({
        required this.id,
        required this.text,
        required this.outline,
        required this.confidence,
        required this.lang,
    });

    factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: json["Id"],
        text: json["Text"],
        outline: List<double>.from(json["Outline"].map((x) => x?.toDouble())),
        confidence: json["Confidence"]?.toDouble(),
        lang: langValues.map[json["Lang"]]!,
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Text": text,
        "Outline": List<dynamic>.from(outline.map((x) => x)),
        "Confidence": confidence,
        "Lang": langValues.reverse[lang],
    };
}

enum Lang {
    ENG
}

final langValues = EnumValues({
    "eng": Lang.ENG
});

class ValidationChecks {
    int result;
    Validations validations;

    ValidationChecks({
        required this.result,
        required this.validations,
    });

    factory ValidationChecks.fromJson(Map<String, dynamic> json) => ValidationChecks(
        result: json["result"],
        validations: Validations.fromJson(json["validations"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "validations": validations.toJson(),
    };
}

class Validations {
    Validations();

    factory Validations.fromJson(Map<String, dynamic> json) => Validations(
    );

    Map<String, dynamic> toJson() => {
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
