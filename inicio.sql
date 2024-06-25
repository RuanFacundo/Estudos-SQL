use db_deals_homologacao
go

create table another_table (
        country NVARCHAR (2) NOT NULL ,
        name NVARCHAR (15) NOT NULL ,
        description NVARCHAR (50),
        CONSTRAINT pk_another_table
                        PRIMARY KEY (country, name)
);
go
 
create table my_table (
        id INTEGER NOT NULL ,
        country NVARCHAR (2) DEFAULT 'CA'
                CONSTRAINT chk_country
                    CHECK (country IN ('CA', 'US')),
        name NVARCHAR (15),
        CAP_NAME NVARCHAR (15),
        CONSTRAINT pk
                    PRIMARY KEY (id),
        CONSTRAINT fk1
                     FOREIGN KEY (country, name)
                        REFERENCES another_table (country, name),
        CONSTRAINT unq_country
                      UNIQUE (country, name),
        CONSTRAINT chk_upper_name
                        CHECK (cap_name = UPPER(name) )

);
go
