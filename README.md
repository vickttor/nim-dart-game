# Jogo NIM

Nim é um jogo simples, porém desafiador para crianças e adultos. Pode ser jogado com palitos, feijões, moedas, lápis e papel etc. Veio da China antiga e foi tema de estudos acadêmicos desde o início do século XX. Existem várias versões e tanto faz se a regra vencedor/perdedor for invertida. É um instigante exercício de lógica e matemática.

## Como fazer rodar

Para executar a CLI, primeiro instale um pacote de utilitário chamado `ansi_escapes`, ele já está dentro do arquivo pubspec.yaml, então basta rodar:

```bash
dart pub get
```

Após isso será possível rodar a aplicação (estando dentro do diretório do projeto é claro):

```bash
dart run
```

## Correção de Erros

| ⚠️ É necessário que o SDK do dart esteja na versão `v3.0.4` para cima

para atualizar seu `dart-sdk` (no windows) abra o powershell como admnistrador e rode:

```bash
choco upgrade dart-sdk --force
```

Caso esteja usando o dart acomplado ao framework Flutter, então rode

```bash
flutter upgrade --force
```

agora visualize a versão do seu dart com:

```bash
dart --version
```

Deverá aparecer algo como: `Dart SDK version: 3.0.4 (stable) (Wed Jun 7 14:55:32 2023 +0000) on "windows_x64"` em seu terminal. Lembrando que a versão mínima é 3.0.4!
