CREATE TABLE NAMEN
(
  RECNO Integer NOT NULL,
  NAME Varchar(30) COLLATE NONE,
  CONSTRAINT PK_NAMEN PRIMARY KEY (RECNO)
);

CREATE UNIQUE INDEX IX_NAMEN_1 ON NAMEN (NAME);