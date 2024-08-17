# Bento Challenge

## <span style="color: #007BFF;">Descrição</span>

O Bento Challenge é um projeto Flutter que utiliza a <span style="color: #28A745;">Clean Architecture</span> para exemplificar como seria uma estrutura modular, escalável e fácil de manter. O desafio em si teve como objetivos treinar habilidades relacionadas ao layout e usabilidade.

## <span style="color: #007BFF;">Versão</span>

- **Versão do Flutter**: `>=3.3.4 <4.0.0`
- **Version Code**: `1`
- **Version Name**: `1.0`

## <span style="color: #007BFF;">Ambiente</span>

- **SDK Flutter**: `>=3.3.4 <4.0.0`

## <span style="color: #007BFF;">Dependências</span>

- **flutter**: SDK Flutter
- **cupertino_icons**: `^1.0.6`
- **equatable**: `^2.0.5`
- **smooth_page_indicator**: `^1.2.0+3`
- **http**: `^1.2.2`
- **rxdart**: `^0.28.0`
- **provider**: `^6.1.2`
- **cached_network_image**: `^3.0.0`
- **geolocator**: `^9.0.2`
- **geocoding**: `^2.0.5`

## <span style="color: #007BFF;">Dev Dependencies</span>

- **flutter_test**: SDK Flutter
- **flutter_lints**: `^3.0.0`

## <span style="color: #007BFF;">Gerenciador de Estados</span>

- **Provider**: Utilizado para gerenciamento de estados e injeção de dependências.

## <span style="color: #007BFF;">Injeção de Dependências</span>

A injeção de dependências é gerenciada pela classe <span style="color: #28A745;">Providers</span>, configurando todos os providers necessários para o aplicativo:

- **BentoDataSource**: Fornece dados do aplicativo.
- **BentoRepository**: Implementa a lógica de acesso a dados utilizando **BentoDataSource**.
- **BentoUseCasesImpl**: Contém as regras de negócio e utiliza **BentoRepository**.
- **BentoBloc**: Gerencia o estado da UI e interage com **BentoUseCasesImpl**.

## <span style="color: #007BFF;">Como Rodar o Aplicativo</span>

Clone o repositório:

git clone https://github.com/gabrielhfdl/bento-challenge.git

Navegue até o diretório do projeto:

cd bento_challenge

Instale as dependências:

flutter pub get

Execute o aplicativo:

flutter run
