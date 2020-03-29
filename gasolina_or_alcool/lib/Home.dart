import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _gasolina = TextEditingController();
  TextEditingController _alcool = TextEditingController();
  String _textResultado = "";

  void _Calcular(){
      double PrecoGasolina = double.tryParse(_gasolina.text);
      double PrecoAlcool = double.tryParse(_alcool.text);
      if(PrecoAlcool == null || PrecoGasolina == null){
        setState(() {
          _textResultado = "Número inválido, digite números maiores que 0 e ultilizando (.)";
        });
      }else{
        setState(() {
          if((PrecoAlcool/PrecoGasolina)>=0.7){
              _textResultado= "Melhor abastecer com gasolina";
          }else{
              _textResultado = "Melhor abastecer com álcool";
          }
          _LimparCampos();
        });
      }
  }
  void _LimparCampos(){
    _gasolina.text = "";
    _alcool.text = "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment : CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child:Image.asset("img/logo.png")
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:  Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 1.35",
                ),
                controller: _alcool,
                style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.normal
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço da gasolina, ex 2.32"
                ),
                controller: _gasolina,
                style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.normal
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Calcular"),
                  color: Colors.blue,
                  onPressed: ()=> _Calcular(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "$_textResultado",
                  style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.normal
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
              
            ],
          ),
        )
      )
    );
  }
}
