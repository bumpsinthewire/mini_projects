class CurrencyConverter:
    rates = {
            'EUR': 1.20,    # 1 EUR = 1.20 USD
            'JPY': 0.01,    # 1 JPY = 0.01 USD
            }

    @staticmethod
    def to_usd(amount: float, from_currency: str):
        if not CurrencyConverter.is_valid_currency(from_currency):
            raise ValueError(f"Invalid currency: {from_currency}")
        return amount * CurrencyConverter.rates[from_currency]

    @staticmethod
    def is_valid_currency(currency: str):
        return currency in CurrencyConverter.rates

try:
    print(f"100 EUR = {CurrencyConverter.to_usd(100, 'EUR')} USD")  # 120 USD
    print(f"100 JPY = {CurrencyConverter.to_usd(100, 'JPY')} USD")  # 1 USD
    print(f"100 XYZ = {CurrencyConverter.to_usd(100, 'XYZ')} USD")  # None USD
except ValueError as e:
    print(e)
