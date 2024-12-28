# Kategoria Studies

## Tabela Studies

Zawiera informacje o programach studiów:

- **Studies_ID** int – klucz główny, identyfikator programu studiów
- Number_Of_Semesters int – liczba semestrów
- Fee money – opłata za studia
- Seat_Limit int – limit miejsc

```sql
CREATE TABLE Studies (
    Studies_ID int NOT NULL,
    Number_Of_Semesters int NOT NULL,
    Fee money NOT NULL,
    Seat_Limit int NOT NULL,
    CONSTRAINT Studies_pk PRIMARY KEY (Studies_ID)
);
```

## Tabela Studies_Details

Zawiera szczegółowe informacje o programach studiów:

- **Studies_ID** int – klucz główny i klucz obcy, identyfikator programu studiów
- Name nvarchar(40) – nazwa programu studiów
- Description nvarchar(max) – opis programu studiów
- Syllabus nvarchar(max) – sylabus programu studiów
- Coordinator_ID int – klucz obcy, identyfikator koordynatora

```sql
CREATE TABLE Studies_Details (
    Studies_ID int NOT NULL,
    Name nvarchar(40) NOT NULL,
    Description nvarchar(max) NOT NULL,
    Syllabus nvarchar(max) NOT NULL,
    Coordinator_ID int NOT NULL,
    CONSTRAINT Studies_Details_pk PRIMARY KEY (Studies_ID)
);
```

## Tabela Subjects

Zawiera informacje o przedmiotach w programach studiów:

- **Subject_ID** int – klucz główny, identyfikator przedmiotu
- Studies_ID int – klucz obcy, identyfikator programu studiów
- Subject_Name nvarchar(40) – nazwa przedmiotu
- Subject_Description nvarchar(200) – opis przedmiotu

```sql
CREATE TABLE Subjects (
    Subject_ID int NOT NULL,
    Studies_ID int NOT NULL,
    Subject_Name nvarchar(40) NOT NULL,
    Subject_Description nvarchar(200) NOT NULL,
    CONSTRAINT Subjects_pk PRIMARY KEY (Subject_ID)
);
```

## Tabela Studies_Meeting

Zawiera informacje o spotkaniach w ramach programu studiów:

- **Studies_Meeting_ID** int – klucz główny, identyfikator spotkania
- Studies_ID int – klucz obcy, identyfikator programu studiów
- Subject_ID int – klucz obcy, identyfikator przedmiotu
- Translator_ID int – klucz obcy, identyfikator tłumacza
- Language_ID int – klucz obcy, identyfikator języka

```sql
CREATE TABLE Studies_Meeting (
    Studies_Meeting_ID int NOT NULL,
    Studies_ID int NOT NULL,
    Subject_ID int NOT NULL,
    Translator_ID int NOT NULL,
    Language_ID int NOT NULL,
    CONSTRAINT Studies_Meeting_pk PRIMARY KEY (Studies_Meeting_ID)
);
```

## Tabela Studies_Meeting_Details

Zawiera szczegółowe informacje o spotkaniach:

- **Study_Meeting_ID** int – klucz główny i klucz obcy, identyfikator spotkania
- Form nvarchar(20) – forma spotkania
- Date datetime – data spotkania
- Seat_Limit int – limit miejsc
- Duration time(7) – czas trwania spotkania
- Price money – opłata za spotkanie

```sql
CREATE TABLE Studies_Meeting_Details (
    Study_Meeting_ID int NOT NULL,
    Form nvarchar(20) NOT NULL,
    Date datetime NOT NULL,
    Seat_Limit int NOT NULL,
    Duration time(7) NOT NULL,
    Price money NOT NULL,
    CONSTRAINT Studies_Meeting_Details_pk PRIMARY KEY (Study_Meeting_ID)
);
```

## Tabela Studies_Online_Sync_Meeting

Zawiera informacje o synchronicznych spotkaniach online:

- **Studies_Meeting_ID** int – klucz główny, identyfikator spotkania
- Link_To_Meeting nvarchar(max) – link do spotkania

```sql
CREATE TABLE Studies_Online_Sync_Meeting (
    Studies_Meeting_ID int NOT NULL,
    Link_To_Meeting nvarchar(max) NOT NULL,
    CONSTRAINT Studies_Online_Sync_Meeting_pk PRIMARY KEY (Studies_Meeting_ID)
);
```

## Tabela Studies_Online_Async_Meeting

Zawiera informacje o asynchronicznych spotkaniach online:

- **Studies_Meeting_ID** int – klucz główny, identyfikator spotkania
- Link_To_Meeting nvarchar(max) – link do materiałów

```sql
CREATE TABLE Studies_Online_Async_Meeting (
    Studies_Meeting_ID int NOT NULL,
    Link_To_Meeting nvarchar(max) NOT NULL,
    CONSTRAINT Studies_Online_Async_Meeting_pk PRIMARY KEY (Studies_Meeting_ID)
);
```

## Tabela Studies_Stationary_Meeting

Zawiera informacje o stacjonarnych spotkaniach:

- **Studies_Meeting_ID** int – klucz główny, identyfikator spotkania
- Room nvarchar(20) – numer pokoju

```sql
CREATE TABLE Studies_Stationary_Meeting (
    Studies_Meeting_ID int NOT NULL,
    Room nvarchar(20) NOT NULL,
    CONSTRAINT Studies_Stationary_Meeting_pk PRIMARY KEY (Studies_Meeting_ID)
);
```

## Tabela Student_Meeting

Zawiera informacje o uczestnictwie studentów w spotkaniach:

- **Student_ID** int – klucz główny, identyfikator studenta
- Study_Meeting_ID int – klucz obcy, identyfikator spotkania
- Attendance bit NULL – obecność na spotkaniu
- Meeting_Date date – data spotkania

```sql
CREATE TABLE Student_Meeting (
    Student_ID int NOT NULL,
    Study_Meeting_ID int NOT NULL,
    Attendance bit NULL,
    Meeting_Date date NOT NULL,
    CONSTRAINT Student_Meeting_pk PRIMARY KEY (Student_ID, Study_Meeting_ID)
);
```

## Tabela Grades

Zawiera informacje o ocenach studentów:

- **Student_ID** int – klucz główny, identyfikator studenta
- Subject_ID int – klucz główny, identyfikator przedmiotu
- Grades int – ocena studenta

```sql
CREATE TABLE Grades (
    Student_ID int NOT NULL,
    Subject_ID int NOT NULL,
    Grades int NOT NULL,
    CONSTRAINT Grades_pk PRIMARY KEY (Student_ID, Subject_ID)
);
```

## Tabela Internship

Zawiera informacje o praktykach studenckich:

- **Internship_ID** int – klucz główny, identyfikator praktyki
- Studies_ID int – klucz obcy, identyfikator programu studiów
- Start_Date date – data rozpoczęcia praktyki

```sql
CREATE TABLE Internship (
    Internship_ID int NOT NULL,
    Studies_ID int NOT NULL,
    Start_Date date NOT NULL,
    CONSTRAINT Internship_pk PRIMARY KEY (Internship_ID)
);
```

## Tabela Student_Internship

Zawiera informacje o uczestnictwie studentów w praktykach:

- **Student_ID** int – klucz główny, identyfikator studenta
- Internship_ID int – klucz główny, identyfikator praktyki
- Completion bit NULL – status ukończenia praktyki

```sql
CREATE TABLE Student_Internship (
    Student_ID int NOT NULL,
    Internship_ID int NOT NULL,
    Completion bit NULL,
    CONSTRAINT Student_Internship_pk PRIMARY KEY (Student_ID, Internship_ID)
);
```

### Relacje między tabelami

- Tabela **Studies_Details** odwołuje się do **Studies**.
- Tabela **Subjects** odwołuje się do **Studies**.
- Tabela **Studies_Meeting** odwołuje się do **Studies**, **Subjects**, **Translator**, **Language**.
- Tabela **Studies_Meeting_Details** odwołuje się do **Studies_Meeting**.
- Tabela **Student_Meeting** odwołuje się do **Student** i **Studies_Meeting**.
- Tabela **Grades** odwołuje się do **Student** i **Subjects**.
- Tabela **Internship** odwołuje się do **Studies**.
- Tabela **Student_Internship** odwołuje się do **Student** i **Internship**.

