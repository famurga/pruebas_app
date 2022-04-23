// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromMap(jsonString);

import 'dart:convert';

class DataResponse {
    DataResponse({
        required this.data,
        required this.failed,
        required this.succeeded,
    });

    Moneda data;
    bool failed;
    bool succeeded;

    factory DataResponse.fromJson(String str) => DataResponse.fromMap(json.decode(str));

    

    factory DataResponse.fromMap(Map<String, dynamic> json) => DataResponse(
        data: Moneda.fromMap(json["data"]),
        failed: json["failed"],
        succeeded: json["succeeded"],
    );


}

class Moneda {
    Moneda({
        required this.cryptosSdc,
        required this.monedasSdc,
    });

    List<CryptosSdc> cryptosSdc;
    List<MonedasSdc> monedasSdc;

    factory Moneda.fromJson(String str) => Moneda.fromMap(json.decode(str));



    factory Moneda.fromMap(Map<String, dynamic> json) => Moneda(
        cryptosSdc: List<CryptosSdc>.from(json["cryptosSdc"].map((x) => CryptosSdc.fromMap(x))),
        monedasSdc: List<MonedasSdc>.from(json["monedasSdc"].map((x) => MonedasSdc.fromMap(x))),
    );

}

class CryptosSdc {
    CryptosSdc({
        required this.id,
        required this.descripcion,
        required this.alias,
        required this.logo,
        required this.formato,
        required this.precisionCompra,
        required this.precisionVenta,
        required this.estadoId,
        required this.principalId,
        required this.defectoId,
    });

    String id;
    String descripcion;
    String alias;
    String logo;
    String formato;
    int precisionCompra;
    int precisionVenta;
    bool estadoId;
    bool principalId;
    bool defectoId;

    factory CryptosSdc.fromJson(String str) => CryptosSdc.fromMap(json.decode(str));

  

    factory CryptosSdc.fromMap(Map<String, dynamic> json) => CryptosSdc(
        id: json["id"],
        descripcion: json["descripcion"],
        alias: json["alias"],
        logo: json["logo"],
        formato: json["formato"],
        precisionCompra: json["precisionCompra"],
        precisionVenta: json["precisionVenta"],
        estadoId: json["estadoId"],
        principalId: json["principalId"],
        defectoId: json["defectoId"],
    );

}

class MonedasSdc {
    MonedasSdc({
        required this.id,
        required this.codigo,
        required this.descripcion,
        required this.alias,
        required this.principalId,
        required this.defectoId,
        required this.defectoMonedaLocal,
        required this.estadoId,
        required this.precioCompra,
        required this.precioVenta,
    });

    String id;
    String codigo;
    String descripcion;
    String alias;
    bool principalId;
    bool defectoId;
    bool defectoMonedaLocal;
    bool estadoId;
    double precioCompra;
    double precioVenta;

    factory MonedasSdc.fromJson(String str) => MonedasSdc.fromMap(json.decode(str));



    factory MonedasSdc.fromMap(Map<String, dynamic> json) => MonedasSdc(
        id: json["id"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        alias: json["alias"],
        principalId: json["principalId"],
        defectoId: json["defectoId"],
        defectoMonedaLocal: json["defectoMonedaLocal"],
        estadoId: json["estadoId"],
        precioCompra: json["precioCompra"].toDouble(),
        precioVenta: json["precioVenta"].toDouble(),
    );

}
