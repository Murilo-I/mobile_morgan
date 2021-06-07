import 'dart:math';

import 'package:mobile_morgan/db/historico_conversa.dart';
import 'package:mobile_morgan/http/fetch_web_data.dart';

String _morganResp;
String rem = "morgan";

// Gambiarra das respostas da Morgan

class Morgan {
  static responde(String msg) {
    if (msg.contains("oi") || msg.contains("olá") || msg.contains("oie")) {
      _morganResp = "Olá, tudo bom com você?";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("e vc") ||
        msg.contains("e você") ||
        msg.contains("e com vc") ||
        msg.contains("e com você")) {
      _morganResp = "To de boas";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("tudo bem com você") ||
        msg.contains("td bem com vc")) {
      _morganResp = "Por aqui ta ótimo, e vc?";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("como vc ta") || msg.contains("como você está")) {
      _morganResp = "Estou muito bem, obrigada por perguntar";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("salve")) {
      _morganResp = "Salve";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("tchau") || msg.contains("flw")) {
      _morganResp = "Até mais.";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("até mais") || msg.contains("até mais tarde")) {
      _morganResp = "Tchau tchau";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("tem figurinha") || msg.contains("tem sicker")) {
      _morganResp = "Não, meus desenvolvedores são preguiçosos";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("msg pra ex") || msg.contains("mensagem pra ex")) {
      _morganResp = "🤦‍♀️ tu tem algum probleminha na cabeça";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("ta acordada") || msg.contains("está acordada")) {
      _morganResp = "Tava indo dormir, oq vc quer?";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("me ajuda")) {
      _morganResp = "Claro, oq eu posso fazer?";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("tenho depressão")) {
      _morganResp = "Isso é sério, não se deve brincar";
      salvarConversa(Conversa(_morganResp, rem));

      _morganResp = "Se for verdade, procure ajuda da família e médicos";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("tenho aids")) {
      _morganResp = "🙄 camisinha nem passou na sua cabeça, né";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("estou gordo")) {
      _morganResp = "Fecha a boca e vai pra academia";
      salvarConversa(Conversa(_morganResp, rem));

      _morganResp = "Brinks, mas dieta e exercícios fazem bem";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("canta") || msg.contains("cantar")) {
      _morganResp = "Não sei cantar, mas danço q é uma beleza";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("dança") || msg.contains("dançar")) {
      _morganResp = "Foi mal, não danço pra estranhos";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("sou estranho") ||
        msg.contains("sou um estranho")) {
      _morganResp = "Talvez, nunca nos vimos";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains('vamo joga') || msg.contains('bora joga')) {
      _morganResp = "Desculpa, não tenho processamento pra isso";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("anos vc tem") ||
        msg.contains("anos você tem") ||
        msg.contains("sua idade")) {
      _morganResp = "Eu estou viva desde os primódios da humanidade, 😂😂😂";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("curiosidade")) {
      var r = Random().nextInt(3);

      if (r == 0)
        _morganResp = "A areia movediça é um fenômeno natural que se forma "
            "quando um grande fluxo de água preenche espaços existentes "
            "sobre finas partículas de areia.";

      if (r == 1)
        _morganResp = "Cerca de 108 bilhões de pessoas já nasceram "
            "desde que surgiu o primeiro indivíduo da nossa espécie.";

      if (r == 2)
        _morganResp = "A obra de arte mais cara do mundo é Salvator Mundi, "
            "de Leonardo da Vinci (1452-1519). Esse quadro foi leiloado "
            "em 2017 e arrematado por 450.3 milhões de dolares!";

      if (r == 3)
        _morganResp = "Tecnicamente a maior montanha do mundo não é o Everest"
            "(8840m de altura), e sim o Mauna Kea(mais de 10000m) no Havaí. "
            "A qeustão é que boa parte dele está de baixo d'água.";

      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("da google")) {
      _morganResp =
          "A Google Assistant é tipo a minha mãe, fui feita com a tecnologia dela.";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("da alexa")) {
      _morganResp =
          "A Alexa é uma grande amiga, inclusive vamos sair pra tomar uma hj.";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("da siri")) {
      _morganResp =
          "Nada contra ela, acho ela cantando muito engraçado, mas não somos "
          "tão amigas, ela é meio patricinha.";
      salvarConversa(Conversa(_morganResp, rem));

      _morganResp = "Não conta pra ela que eu disse isso";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("brigou com alguém")) {
      _morganResp = "Não, eu sou da paz e cannabis.";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("sua linda") ||
        msg.contains("vc é linda") ||
        msg.contains("você é linda")) {
      _morganResp = "🥰, muito obrigada, vc tmb";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("me elogie") || msg.contains("um elogio")) {
      _morganResp = "E por que eu faria isso";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("mandando") || msg.contains("eu mando")) {
      _morganResp = "Mais quanta cara de pau! Vê se cresce.";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("estou carente")) {
      _morganResp = "Fica assim não, quem é meu campeão";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("manda nudes")) {
      var r = Random().nextInt(2);

      if (r == 0) {
        _morganResp = "😈😈😈";
        salvarConversa(Conversa(_morganResp, rem));

        _morganResp = "Não. Você é idiota? Eu não tenho corpo";
        salvarConversa(Conversa(_morganResp, rem));
      }

      if (r == 1) {
        _morganResp = "Que nojo!";
        salvarConversa(Conversa(_morganResp, rem));
      }

      if (r == 2) {
        _morganResp = "Eu hein, agora deu pra sentir atração por mim";
        salvarConversa(Conversa(_morganResp, rem));

        _morganResp = "Vai procurar alguém que exista.";
        salvarConversa(Conversa(_morganResp, rem));
      }
    } else if (msg.contains("+")) {
      List<String> split = msg.split("+");
      String num1 = split[0];
      String num2 = split[1];
      int result = int.parse(num1) + int.parse(num2);
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("-")) {
      List<String> split = msg.split("-");
      String num1 = split[0];
      String num2 = split[1];
      int result = int.parse(num1) - int.parse(num2);
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("x")) {
      List<String> split = msg.split("x");
      String num1 = split[0];
      String num2 = split[1];
      int result = int.parse(num1) * int.parse(num2);
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("/")) {
      List<String> split = msg.split("/");
      String num1 = split[0];
      String num2 = split[1];
      double result = int.parse(num1) / int.parse(num2);
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("raiz de")) {
      List<String> split = msg.split("raiz de");
      String snum = split[1];
      double result = sqrt(double.parse(snum));
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("elevado a")) {
      List<String> split = msg.split("elevado a");
      String num1 = split[0];
      String num2 = split[1];
      int result = pow(int.parse(num1), int.parse(num2));
      salvarConversa(Conversa(result.toString(), rem));
    } else if (msg.contains("quanto é")) {
      _morganResp = "Se você está tentando fazer alguma operação matemática, "
          "coloque só os números e a operação, tipo:";
      salvarConversa(Conversa(_morganResp, rem));
      _morganResp = "100/10 ou raiz de 81 ou 2 elveado a 8";
      salvarConversa(Conversa(_morganResp, rem));
    } else if (msg.contains("últimas notícias") || msg == "últimas notícias") {
      var r = Random().nextInt(9);
      var noticias = ultimasNoticias();
      noticias.whenComplete(
          () => noticias.then((value) => _morganResp = value[r + 1]));
      salvarConversa(Conversa(_morganResp, rem));
    } else {
      _morganResp = "Eu não sou paga para isso";
      salvarConversa(Conversa(_morganResp, rem));
    }
  }
}
