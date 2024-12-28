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

# Kategoria Courses

## Tabela Courses

Zawiera informacje o kursach:

- **Course\_ID** int – klucz główny, identyfikator kursu
- Name nvarchar(30) – nazwa kursu
- Description nvarchar(30) – opis kursu
- Form nvarchar(20) – forma kursu (stacjonarny/online)
- Price money – cena kursu
- Coordinator\_ID int – klucz obcy, identyfikator koordynatora kursu

```sql
CREATE TABLE Courses (
    Course_ID int NOT NULL,
    Name nvarchar(30) NOT NULL,
    Description nvarchar(30) NOT NULL,
    Form nvarchar(20) NOT NULL,
    Price money NOT NULL,
    Coordinator_ID int NOT NULL,
    CONSTRAINT Courses_pk PRIMARY KEY (Course_ID)
);
```

## Tabela Course\_Meeting

Zawiera informacje o spotkaniach kursów:

- **Course\_Meeting\_ID** int – klucz główny, identyfikator spotkania kursu
- Course\_ID int – klucz obcy, identyfikator kursu
- Form nvarchar(20) – forma spotkania
- Date datetime – data spotkania
- Duration time(7) – czas trwania spotkania
- Instructor\_ID int – klucz obcy, identyfikator instruktora
- Language\_ID int – klucz obcy, identyfikator języka
- Translator\_ID int NULL – klucz obcy, identyfikator tłumacza

```sql
CREATE TABLE Course_Meeting (
    Course_Meeting_ID int NOT NULL,
    Course_ID int NOT NULL,
    Form nvarchar(20) NOT NULL,
    Date datetime NOT NULL,
    Duration time(7) NOT NULL,
    Instructor_ID int NOT NULL,
    Language_ID int NOT NULL,
    Translator_ID int NULL,
    CONSTRAINT Course_Meeting_pk PRIMARY KEY (Course_Meeting_ID)
);
```

## Tabela Course\_Online\_Sync\_Meeting

Zawiera informacje o synchronicznych spotkaniach online:

- **Course\_Meeting\_ID** int – klucz główny, identyfikator spotkania kursu
- Link\_To\_Meeting nvarchar(max) – link do spotkania

```sql
CREATE TABLE Course_Online_Sync_Meeting (
    Course_Meeting_ID int NOT NULL,
    Link_To_Meeting nvarchar(max) NOT NULL,
    CONSTRAINT Course_Online_Sync_Meeting_pk PRIMARY KEY (Course_Meeting_ID)
);
```

## Tabela Course\_Online\_Async\_Meeting

Zawiera informacje o asynchronicznych spotkaniach online:

- **Course\_Meeting\_ID** int – klucz główny, identyfikator spotkania kursu
- Link\_To\_Meeting nvarchar(max) – link do materiałów

```sql
CREATE TABLE Course_Online_Async_Meeting (
    Course_Meeting_ID int NOT NULL,
    Link_To_Meeting nvarchar(max) NOT NULL,
    CONSTRAINT Course_Online_Async_Meeting_pk PRIMARY KEY (Course_Meeting_ID)
);
```

## Tabela Course\_Stationary\_Meeting

Zawiera informacje o stacjonarnych spotkaniach kursów:

- **Course\_Meeting\_ID** int – klucz główny, identyfikator spotkania kursu
- Room nvarchar(20) – numer pokoju
- Seats\_Limit int – limit miejsc

```sql
CREATE TABLE Course_Stationary_Meeting (
    Course_Meeting_ID int NOT NULL,
    Room nvarchar(20) NOT NULL,
    Seats_Limit int NOT NULL,
    CONSTRAINT Course_Stationary_Meeting_pk PRIMARY KEY (Course_Meeting_ID)
);
```

## Tabela Participant\_Course

Zawiera informacje o uczestnikach kursów:

- **Participant\_ID** int – klucz główny, identyfikator uczestnika
- Course\_ID int – klucz obcy, identyfikator kursu
- Completion\_Percentage int – procent ukończenia kursu

```sql
CREATE TABLE Participant_Course (
    Participant_ID int NOT NULL,
    Course_ID int NOT NULL,
    Completion_Percentage int NOT NULL,
    CONSTRAINT Participant_Course_pk PRIMARY KEY (Participant_ID)
);
```

## Tabela Participant\_Meeting

Zawiera informacje o udziale uczestników w spotkaniach:

- **Course\_Meeting\_ID** int – klucz główny, identyfikator spotkania kursu
- Participant\_ID int – klucz obcy, identyfikator uczestnika
- Attendance bit NULL – obecność na spotkaniu

```sql
CREATE TABLE Participant_Meeting (
    Course_Meeting_ID int NOT NULL,
    Participant_ID int NOT NULL,
    Attendance bit NULL,
    CONSTRAINT Participant_Meeting_pk PRIMARY KEY (Course_Meeting_ID)
);
```
