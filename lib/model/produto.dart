class Produto {
  int? id;
  String? nome;
  String? imagem;
  String? descricao;
  String? medida;
  String? peso;
  double? preco;
  double? minimoVenda;
  int? indisponivel;

  Produto(
      {this.id,
      this.nome,
      this.imagem,
      this.descricao,
      this.medida,
      this.preco,
      this.peso,
      this.minimoVenda,
      this.indisponivel});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
    descricao = json['descricao'];
    medida = json['medida'];
    preco = json['preco'];
    peso = json['peso'];
    minimoVenda = json['minimoVenda'];
    indisponivel = json['indisponivel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['descricao'] = this.descricao;
    data['medida'] = this.medida;
    data['preco'] = this.preco;
    data['peso'] = this.peso;
    data['minimoVenda'] = this.minimoVenda;
    data['indisponivel'] = this.indisponivel;
    return data;
  }
}
