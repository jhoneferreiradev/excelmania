import 'package:excelmania/util/utilidades_geral.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateFormat ddMMyyyyHHmmss = DateFormat('dd/MM/yyyy HH:mm:ss');
final DateFormat ddMMyyyy = DateFormat('dd/MM/yyyy');
final DateFormat yyyyMMdd = DateFormat('yyyy-MM-dd');
const int daysOfYear = 365;

DateTime get agoraSemUTC => DateTime.now();

DateTime get agoraUTCBrasilia => _getAgoraComUTCBrasilia();

DateTime _getAgoraComUTCBrasilia() {
  // Obtém a data e hora corrente em UTC
  DateTime currentDateTimeUTC = DateTime.now().toUtc();

  // Obtém o fuso horário correspondente ao Horário de Brasília (UTC-3)
  Duration brTimeZoneOffset = const Duration(hours: -3);
  DateTime currentDateTimeUTCMinus3 = currentDateTimeUTC.add(brTimeZoneOffset);

  return currentDateTimeUTCMinus3;
}

DateTime get doisAnosPassado => DateUtils.addDaysToDate(agoraSemUTC, -(daysOfYear * 2));

DateTime get doisAnosFuturo => DateUtils.addDaysToDate(agoraSemUTC, (daysOfYear * 2));

String converterDataPara_ddmmyyyyhhmmss(DateTime? dateTime) {
  if (isNull(dateTime)) {
    return "";
  }
  return ddMMyyyyHHmmss.format(dateTime!);
}

String converterDataPara_ddMMyyyy(DateTime? dateTime) {
  if (isNull(dateTime)) {
    return "";
  }
  return ddMMyyyy.format(dateTime!);
}

String converterDataPara_yyyyMMdd(DateTime? dateTime) {
  if (isNull(dateTime)) {
    return "";
  }
  return yyyyMMdd.format(dateTime!);
}

List<String> _meses = [];

List<String> getMeses() {
  if (_meses.isEmpty) {
    for (int i = 1; i <= DateTime.monthsPerYear; i++) {
      _meses.add(i.toString().padLeft(2, '0') + getNomeDoMes(i));
    }
  }
  return _meses;
}

String getNomeDoMes(int month) {
  switch (month) {
    case DateTime.january:
      return "Janeiro";
    case DateTime.february:
      return "Fevereiro";
    case DateTime.march:
      return "Março";
    case DateTime.april:
      return "Abril";
    case DateTime.may:
      return "Maio";
    case DateTime.june:
      return "Junho";
    case DateTime.july:
      return "Julho";
    case DateTime.august:
      return "Agosto";
    case DateTime.september:
      return "Setembro";
    case DateTime.october:
      return "Outubro";
    case DateTime.november:
      return "Novembro";
    case DateTime.december:
    default:
      return "Dezembro";
  }
}

String getNomeDoMesAbreviado(int mes) {
  return getNomeDoMes(mes).substring(0, 3);
}

DateTime getPrimeiroDiaDoMes(int month, int year) {
  return DateTime(year, month, 1);
}

DateTime getData(String texto) {
  texto = texto.replaceAll("/", "");
  String dia = texto.substring(0, 2);
  String mes = texto.substring(2, 4);
  String ano = texto.substring(4);
  return DateTime(int.parse(ano), int.parse(mes), int.parse(dia));
}

bool mesmaData(DateTime data_1, DateTime data_2) {
  return DateUtils.isSameDay(data_1, data_2);
}

bool estaNaSemanaAtual(DateTime data) {
  DateTime firstDayOfWeek = DateUtils.dateOnly(getPrimeiroDiaDaSemanaCorrente());
  DateTime lastDayOfWeek = getUltimoDiaDaSemanaCorrente();

  return (mesmaData(DateUtils.dateOnly(data), firstDayOfWeek) || data.isAfter(firstDayOfWeek)) &&
      (mesmaData(DateUtils.dateOnly(data), lastDayOfWeek) || data.isBefore(lastDayOfWeek));
}

DateTime getPrimeiroDiaDaSemanaCorrente() {
  DateTime today = DateUtils.dateOnly(DateTime.now());
  int currentDay = today.weekday;
  return DateUtils.dateOnly(today.subtract(Duration(days: currentDay - 1)));
}

DateTime getUltimoDiaDaSemanaCorrente() {
  return DateUtils.dateOnly(getPrimeiroDiaDaSemanaCorrente().add(const Duration(days: 6)));
}

DateTime converterParaDateTime(String stringDate) {
  stringDate = stringDate.replaceAll("/", "");
  String day = stringDate.substring(0, 2);
  String month = stringDate.substring(2, 4);
  String year = stringDate.substring(4);
  return DateTime(int.parse(year), int.parse(month), int.parse(day));
}

DateTime converterJavaInstantParaDataHora(String data) {
  // Exemplo de data 2024-02-14T02:16:56.563447300
  int inicioMilisegundo = data.indexOf(".");
  data = data.substring(0, inicioMilisegundo);
  // Ficou assim 2024-02-14T02:16:56
  data = data.replaceAll("-", "");
  data = data.replaceAll("T", "");
  data = data.replaceAll(":", "");
  // Ficou assim 20240214021656
  String ano = data.substring(0, 4);
  String mes = data.substring(4, 6);
  String dia = data.substring(6, 8);
  String hora = data.substring(8, 10);
  String minuto = data.substring(10, 12);
  String segundo = data.substring(12);
  return DateTime(int.parse(ano), int.parse(mes), int.parse(dia), int.parse(hora), int.parse(minuto), int.parse(segundo));
}

DateTime converterJavaLocalDateParaDateTime(String data) {
  // Exemplo de data 2024-02-14
  data = data.replaceAll("-", "");
  String ano = data.substring(0, 4);
  String mes = data.substring(4, 6);
  String dia = data.substring(6, 8);
  return DateTime(int.parse(ano), int.parse(mes), int.parse(dia));
}

DateTime calcularProximaDataVencimentoDoCartao(int diaVencimento, int diasParaFechamento, DateTime dataCriacaoMovimentacao) {
  var dataVencimentoInicial = DateTime(dataCriacaoMovimentacao.year, dataCriacaoMovimentacao.month, diaVencimento);
  var dataFechamentoInicial = dataVencimentoInicial.add(Duration(days: -diasParaFechamento));

  if (dataCriacaoMovimentacao.isAfter(dataFechamentoInicial)) {
    var dataVencimentoCalculada = DateUtils.addMonthsToMonthDate(dataVencimentoInicial, 1);
    return DateTime(dataVencimentoCalculada.year, dataVencimentoCalculada.month, diaVencimento);
  }

  return dataVencimentoInicial;
}

bool isDataPassada(DateTime data) {
  return DateUtils.dateOnly(data).isBefore(DateUtils.dateOnly(DateTime.now()));
}

bool isHojeOuFuturo(DateTime data) {
  return !isDataPassada(data);
}
