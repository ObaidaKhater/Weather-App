class PlaceAutoCompleteResponse {
  List<Predictions>? predictions;
  String? status;

  PlaceAutoCompleteResponse({this.predictions, this.status});

  PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions!.add(Predictions.fromJson(v));
      });
    }
    status = json['status'];
  }
}

class Predictions {
  String? description;
  List<MatchedSubstrings>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Terms>? terms;
  List<String>? types;

  Predictions(
      {this.description,
      this.matchedSubstrings,
      this.placeId,
      this.reference,
      this.structuredFormatting,
      this.terms,
      this.types});

  Predictions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['matched_substrings'] != null) {
      matchedSubstrings = <MatchedSubstrings>[];
      json['matched_substrings'].forEach((v) {
        matchedSubstrings!.add(MatchedSubstrings.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null
        ? StructuredFormatting.fromJson(json['structured_formatting'])
        : null;
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(Terms.fromJson(v));
      });
    }
    types = json['types'].cast<String>();
  }
}

class MatchedSubstrings {
  int? length;
  int? offset;

  MatchedSubstrings({this.length, this.offset});

  MatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }
}

class StructuredFormatting {
  String? mainText;
  List<MatchedSubstrings>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting(
      {this.mainText, this.mainTextMatchedSubstrings, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = <MatchedSubstrings>[];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings!.add(MatchedSubstrings.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }
}

class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }
}
