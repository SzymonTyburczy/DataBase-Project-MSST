# Kategoria People

## Tabela Position

Zawiera informacje o stanowiskach:

- **Position_ID** int – klucz główny, identyfikator stanowiska
- Position_Name nvarchar(40) – nazwa stanowiska
- Permissions nvarchar(40) – uprawnienia przypisane do stanowiska

```sql
-- Table: Position
CREATE TABLE Position (
    Position_ID int  NOT NULL,
    Position_Name nvarchar(40)  NOT NULL,
    Permisstions nvarchar(40)  NOT NULL,
    CONSTRAINT Position_pk PRIMARY KEY  (Position_ID)
);
```

## Tabela Users

Zawiera informacje o użytkownikach:

- **User_ID** int – klucz główny, identyfikator użytkownika
- First_Name nvarchar(20) – imię użytkownika
- Last_Name nvarchar(20) – nazwisko użytkownika
- Account_Status nvarchar(20) – status konta
- Address nvarchar(40) – adres zamieszkania
- Postal_Code nvarchar(10) – kod pocztowy
- GDPR_Data_Consent date – data zgody na przetwarzanie danych osobowych

```sql
-- Table: Users
CREATE TABLE Users (
    User_ID int  NOT NULL,
    First_Name nvarchar(20)  NOT NULL,
    Last_Name nvarchar(20)  NOT NULL,
    Account_Status nvarchar(20)  NOT NULL,
    Address nvarchar(40)  NOT NULL,
    Postal_Code nvarchar(6)  NOT NULL,
    GDPR_Date_Consent date  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY  (User_ID)
);
```

## Tabela Students

Zawiera informacje o studentach:

- **Student_ID** int – klucz główny, identyfikator studenta
- Studies_ID int – klucz obcy, identyfikator kierunku studiów

```sql
-- Table: Students
CREATE TABLE Students (
    Student_ID int  NOT NULL,
    Studies_ID int  NOT NULL,
    CONSTRAINT Students_pk PRIMARY KEY  (Student_ID)
);
```

## Tabela Employees

Zawiera informacje o pracownikach:

- **Employee_ID** int – klucz główny, identyfikator pracownika
- Position_ID int – klucz obcy, identyfikator stanowiska
- First_Name nvarchar(20) – imię pracownika
- Last_Name nvarchar(20) – nazwisko pracownika

```sql
-- Table: Employees
CREATE TABLE Employees (
    Employee_ID int  NOT NULL,
    First_Name nvarchar(20)  NOT NULL,
    Last_Name nvarchar(20)  NOT NULL,
    Position_ID int  NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY  (Employee_ID)
);
```

## Tabela Translators

Zawiera informacje o tłumaczach i obsługiwanych językach:

- **Translator_ID** int – klucz główny, identyfikator tłumacza
- **Language_ID** int – klucz obcy, identyfikator języka

```sql
-- Table: Translator
CREATE TABLE Translator (
    Translator_ID int  NOT NULL,
    Language_ID int  NOT NULL,
    CONSTRAINT Translator_pk PRIMARY KEY  (Translator_ID)
);
```

## Tabela Language

Zawiera informacje o obsługiwanych językach:

- **Language_ID** int – klucz główny, identyfikator języka
- Language nvarchar(20) – nazwa języka

```sql
-- Table: Language
CREATE TABLE Language (
    Language_ID int  NOT NULL,
    Language nvarchar(20)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY  (Language_ID)
);
```

