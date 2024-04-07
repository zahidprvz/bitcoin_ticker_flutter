# Bitcoin Ticker App

Bitcoin Ticker App is a mobile application developed using Flutter framework, which provides real-time exchange rates for various cryptocurrencies against different fiat currencies.

![Bitcoin Ticker App Demo](bitcointicker.gif)

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- Real-time exchange rates for popular cryptocurrencies like Bitcoin (BTC), Ethereum (ETH), and Litecoin (LTC).
- Supports multiple fiat currencies, including USD, EUR, GBP, and more.
- Intuitive user interface with dropdown menu for currency selection.
- Platform-specific UI components using Cupertino (iOS) and Material Design (Android) widgets.
- Error handling for network requests and data fetching.

## Installation

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter plugins installed
- [Git](https://git-scm.com/)

### Clone Repository

```
git clone https://github.com/zahidprvz/bitcoin_ticker_flutter.git
```

### Install Dependencies

Navigate to the project directory and run:

```
flutter pub get
```

## Usage

### Run the App

Connect your device/emulator and run the app using the following command:

```
flutter run
```

### Select Cryptocurrency and Currency

- Use the dropdown menu at the bottom of the screen to select a cryptocurrency (Bitcoin, Ethereum, or Litecoin).
- Use the dropdown menu at the top of the screen to select a fiat currency (USD, EUR, GBP, etc.).

### View Exchange Rates

- After selecting both cryptocurrency and currency, the app will display the current exchange rate for the selected cryptocurrency against the selected fiat currency.
- Exchange rates are updated in real-time and displayed at the top of the screen.

## Contributing

Contributions are welcome! Please feel free to open issues or pull requests for any bug fixes, improvements, or new features.

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Create a new Pull Request.

## License

[MIT License](LICENSE)
