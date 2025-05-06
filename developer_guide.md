# Guia do Desenvolvedor - Guardião

## Configuração Inicial
1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/guardiao.git
   cd guardiao
   ```

2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Configure o Firebase**:
   - Adicione os arquivos `google-services.json` (Android) e `GoogleService-Info.plist` (iOS) na pasta apropriada.

4. **Inicie o app**:
   ```bash
   flutter run
   ```

## Estrutura de Pastas
- `lib/screens`: Telas do aplicativo.
- `lib/services`: Serviços como autenticação, logs e relatórios.
- `lib/widgets`: Widgets reutilizáveis.

## Regras do Firebase
Certifique-se de aplicar as [regras de segurança](../firebase/firestore.rules) fornecidas.

## Testes
Execute os testes com:
```bash
flutter test
```