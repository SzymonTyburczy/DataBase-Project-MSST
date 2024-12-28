# Kategoria Orders

## Tabela Orders

Zawiera informacje o zamówieniach:

- **Order_ID** int – klucz główny, identyfikator zamówienia
- Client_ID int – klucz obcy, identyfikator klienta
- Order_Date datetime – data zamówienia
- Payment_Link nvarchar(max) – link do płatności

```sql
CREATE TABLE Orders (
    Order_ID int NOT NULL,
    Client_ID int NOT NULL,
    Order_Date datetime NOT NULL,
    Payment_Link nvarchar(max) NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY (Order_ID)
);
```

## Tabela Orders_Details

Zawiera szczegółowe informacje o zamówieniach:

- **Details_ID** int – klucz główny, identyfikator szczegółów zamówienia
- Order_ID int – klucz obcy, identyfikator zamówienia
- Payment_Deadline datetime – termin płatności
- Currency_ID int – klucz obcy, identyfikator waluty
- Price money – cena zamówienia

```sql
CREATE TABLE Orders_Details (
    Details_ID int NOT NULL,
    Order_ID int NOT NULL,
    Payment_Deadline datetime NOT NULL,
    Currency_ID int NOT NULL,
    Price money NOT NULL,
    CONSTRAINT Orders_Details_pk PRIMARY KEY (Details_ID),
    CONSTRAINT Orders_Details_fk_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT Orders_Details_fk_currency FOREIGN KEY (Currency_ID) REFERENCES Exchange_Rate(Currency_ID)
);
```

## Tabela Exchange_Rate

Zawiera informacje o kursach walut:

- **Currency_ID** int – klucz główny, identyfikator waluty
- Zloty money – kurs PLN
- Euro money – kurs EUR
- Dolar money – kurs USD
- Funt money – kurs GBP

```sql
CREATE TABLE Exchange_Rate (
    Currency_ID int NOT NULL,
    Zloty money NOT NULL,
    Euro money NOT NULL,
    Dolar money NOT NULL,
    Funt money NOT NULL,
    CONSTRAINT Exchange_Rate_pk PRIMARY KEY (Currency_ID)
);
```

## Tabela Webinar_Orders

Zawiera powiązania zamówień z webinarami:

- **Details_ID** int – klucz główny, identyfikator szczegółów zamówienia
- **Webinar_ID** int – klucz obcy, identyfikator webinaru

```sql
CREATE TABLE Webinar_Orders (
    Details_ID int NOT NULL,
    Webinar_ID int NOT NULL,
    CONSTRAINT Webinar_Orders_pk PRIMARY KEY (Details_ID, Webinar_ID),
    CONSTRAINT Webinar_Orders_fk FOREIGN KEY (Details_ID) REFERENCES Orders_Details(Details_ID)
);
```

## Tabela Studies_Orders

Zawiera powiązania zamówień z kursami studiów:

- **Details_ID** int – klucz główny, identyfikator szczegółów zamówienia
- **Studies_ID** int – klucz obcy, identyfikator kursu studiów

```sql
CREATE TABLE Studies_Orders (
    Details_ID int NOT NULL,
    Studies_ID int NOT NULL,
    CONSTRAINT Studies_Orders_pk PRIMARY KEY (Details_ID, Studies_ID),
    CONSTRAINT Studies_Orders_fk FOREIGN KEY (Details_ID) REFERENCES Orders_Details(Details_ID)
);
```

## Tabela Course_Orders

Zawiera powiązania zamówień z kursami:

- **Details_ID** int – klucz główny, identyfikator szczegółów zamówienia
- **Course_ID** int – klucz obcy, identyfikator kursu

```sql
CREATE TABLE Course_Orders (
    Details_ID int NOT NULL,
    Course_ID int NOT NULL,
    CONSTRAINT Course_Orders_pk PRIMARY KEY (Details_ID, Course_ID),
    CONSTRAINT Course_Orders_fk FOREIGN KEY (Details_ID) REFERENCES Orders_Details(Details_ID)
);
```

### Relacje między tabelami

- Tabela **Orders_Details** odwołuje się do **Orders** oraz **Exchange_Rate** (klucze obce).
- Tabela **Webinar_Orders** odwołuje się do **Orders_Details**.
- Tabela **Studies_Orders** odwołuje się do **Orders_Details**.
- Tabela **Course_Orders** odwołuje się do **Orders_Details**.
- Tabela **Orders** odwołuje się do **Users** jako klientów zamówień.

