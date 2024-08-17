Bento Challenge
<span style="color: #007BFF;">Description</span>
The Bento Challenge is a Flutter project that uses <span style="color: #28A745;">Clean Architecture</span> to exemplify how a modular, scalable, and maintainable structure would look. The challenge aimed to train skills related to layout and usability.

<span style="color: #007BFF;">Version</span>
Flutter Version: >=3.3.4 <4.0.0
Version Code: 1
Version Name: 1.0
<span style="color: #007BFF;">Environment</span>
Flutter SDK: >=3.3.4 <4.0.0
<span style="color: #007BFF;">Dependencies</span>
flutter: Flutter SDK
cupertino_icons: ^1.0.6
equatable: ^2.0.5
smooth_page_indicator: ^1.2.0+3
http: ^1.2.2
rxdart: ^0.28.0
provider: ^6.1.2
cached_network_image: ^3.0.0
geolocator: ^9.0.2
geocoding: ^2.0.5
<span style="color: #007BFF;">Dev Dependencies</span>
flutter_test: Flutter SDK
flutter_lints: ^3.0.0
<span style="color: #007BFF;">State Management</span>
Provider: Used for state management and dependency injection.
<span style="color: #007BFF;">Dependency Injection</span>
Dependency injection is managed by the <span style="color: #28A745;">Providers</span> class, setting up all the necessary providers for the application:

BentoDataSource: Provides application data.
BentoRepository: Implements data access logic using BentoDataSource.
BentoUseCasesImpl: Contains business rules and uses BentoRepository.
BentoBloc: Manages the UI state and interacts with BentoUseCasesImpl.
<span style="color: #007BFF;">How to Run the App</span>
Clone the repository:

git clone https://github.com/gabrielhfdl/bento-challenge.git

Navigate to the project directory:

cd bento_challenge

Install the dependencies:

flutter pub get

Run the app:

flutter run
===================================================================

**pt-BR**
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
