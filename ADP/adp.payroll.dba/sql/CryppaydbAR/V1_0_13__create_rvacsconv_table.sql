CREATE TABLE RVACSCONV (
	CodConv INTEGER,
	Tramo INTEGER,
	Dias INTEGER,
	TipoDias INTEGER ,
	IniVigncia DATETIME,
	FinVigncia DATETIME,
	Jdd INTEGER NOT NULL,
	CONSTRAINT PK_VacsConv PRIMARY KEY (CodConv, Tramo, IniVigncia, FinVigncia)
)
