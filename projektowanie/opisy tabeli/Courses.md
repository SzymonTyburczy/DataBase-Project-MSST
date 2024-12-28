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

