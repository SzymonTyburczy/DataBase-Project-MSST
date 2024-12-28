# Kategoria Webinars

## Tabela Webinars

Zawiera informacje o webinarach:

- **Webinar_ID** int – klucz główny, identyfikator webinaru
- Instructor_ID int – klucz obcy, identyfikator instruktora
- Translator_ID int NULL – klucz obcy, identyfikator tłumacza
- Webinar_Name varchar(40) – nazwa webinaru
- Webinar_Date date – data webinaru
- Language_ID int – klucz obcy, identyfikator języka

```sql
CREATE TABLE Webinars (
    Webinar_ID int NOT NULL,
    Instructor_ID int NOT NULL,
    Translator_ID int NULL,
    Webinar_Name varchar(40) NOT NULL,
    Webinar_Date date NOT NULL,
    Language_ID int NOT NULL,
    CONSTRAINT Webinars_pk PRIMARY KEY (Webinar_ID)
);
```

## Tabela Webinar_Details

Zawiera szczegółowe informacje o webinarach:

- **Webinar_ID** int – klucz główny, identyfikator webinaru
- Price money – cena webinaru
- Details nvarchar(max) – szczegóły webinaru
- Link_To_Recording nvarchar(max) – link do nagrania
- Duration int – czas trwania webinaru (w minutach)

```sql
CREATE TABLE Webinar_Details (
    Webinar_ID int NOT NULL,
    Price money NOT NULL,
    Details nvarchar(max) NOT NULL,
    Link_To_Recording nvarchar(max) NOT NULL,
    Duration int NOT NULL,
    CONSTRAINT Webinar_Details_pk PRIMARY KEY (Webinar_ID)
);
```

## Tabela Participant_Webinar

Zawiera informacje o udziale uczestników w webinarach:

- **Webinar_ID** int – klucz główny, identyfikator webinaru
- Participant_ID int – klucz główny, identyfikator uczestnika
- Webinar_Payment bit – status płatności za webinar
- Webinar_Access bit – status dostępu do webinaru

```sql
CREATE TABLE Participant_Webinar (
    Webinar_ID int NOT NULL,
    Participant_ID int NOT NULL,
    Webinar_Payment bit NOT NULL,
    Webinar_Access bit NOT NULL,
    CONSTRAINT Participant_Webinar_pk PRIMARY KEY (Webinar_ID, Participant_ID)
);
```

### Relacje między tabelami

- Tabela **Course_Meeting** odwołuje się do **Courses**, **Employees** (Instructor_ID), **Language** oraz **Translator**.
- Tabela **Participant_Course** odwołuje się do **Courses**.
- Tabela **Participant_Meeting** odwołuje się do **Course_Meeting** oraz **Participant_Course**.
- Tabela **Webinars** odwołuje się do **Employees** (Instructor_ID), **Language** oraz **Translator**.
- Tabela **Participant_Webinar** odwołuje się do **Webinars**.
