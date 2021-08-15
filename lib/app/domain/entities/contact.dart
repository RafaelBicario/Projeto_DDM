class Contact {
  dynamic id;
  String? raca;
  String? telefone;
  double? valor;
  String? descricao;
  // ignore: non_constant_identifier_names
  dynamic data_cadastro;

  Contact(
      {this.id,
      this.raca,
      this.telefone,
      this.valor,
      this.descricao,
      // ignore: non_constant_identifier_names
      this.data_cadastro});
}
