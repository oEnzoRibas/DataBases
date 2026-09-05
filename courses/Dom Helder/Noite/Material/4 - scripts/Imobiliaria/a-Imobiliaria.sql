/*==============================================================*/
/* 1) EXCLUINDO AS CONSTRAINTS (CASO JÁ EXISTA ALGUMA)          */
/*==============================================================*/


alter table COMPRADORES
   drop constraint FK_COMPRADORES_PESSOAS
go


alter table CORRETORES
   drop constraint FK_CORRETORES_PESSOAS
go


alter table IMOVEISRURAIS
   drop constraint FK_IMOVEISRURAIS_IMOVEIS
go


alter table IMOVEISURBANOS
   drop constraint FK_IMOVEISUURBANOS_IMOVEIS
go


alter table MELHORIASIMOVEISRURAIS
   drop constraint FK_MELHORIAS_IMOVEISRURAIS
go


alter table NEGOCIACOES
   drop constraint FK_NEGOCIACOES_COMPRADORES
go


alter table NEGOCIACOES
   drop constraint FK_NEGOCIACOES_IMOVEIS
go


alter table NEGOCIACOES
   drop constraint FK_NEGOCIACOES_CORRETORES
go


alter table PROPRIEDADES
   drop constraint FK_PROPRIEDADES_PROPRIETARIOS
go


alter table PROPRIEDADES
   drop constraint FK_PROPRIEDADES_IMOVEIS
go


alter table PROPRIETARIOS
   drop constraint FK_PROPRIETARIOS_PESSOAS
go


/*==============================================================*/
/* 2) EXCLUINDO AS TABELAS (CASO JÁ EXISTA ALGUMA)              */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('COMPRADORES')
            and   type = 'U')
   drop table COMPRADORES
go


if exists (select 1
            from  sysobjects
           where  id = object_id('CORRETORES')
            and   type = 'U')
   drop table CORRETORES
go


if exists (select 1
            from  sysobjects
           where  id = object_id('IMOVEIS')
            and   type = 'U')
   drop table IMOVEIS
go


if exists (select 1
            from  sysobjects
           where  id = object_id('IMOVEISRURAIS')
            and   type = 'U')
   drop table IMOVEISRURAIS
go


if exists (select 1
            from  sysobjects
           where  id = object_id('IMOVEISURBANOS')
            and   type = 'U')
   drop table IMOVEISURBANOS
go


if exists (select 1
            from  sysobjects
           where  id = object_id('MELHORIASIMOVEISRURAIS')
            and   type = 'U')
   drop table MELHORIASIMOVEISRURAIS
go


if exists (select 1
            from  sysobjects
           where  id = object_id('NEGOCIACOES')
            and   type = 'U')
   drop table NEGOCIACOES
go


if exists (select 1
            from  sysobjects
           where  id = object_id('PESSOAS')
            and   type = 'U')
   drop table PESSOAS
go


if exists (select 1
            from  sysobjects
           where  id = object_id('PROPRIEDADES')
            and   type = 'U')
   drop table PROPRIEDADES
go


if exists (select 1
            from  sysobjects
           where  id = object_id('PROPRIETARIOS')
            and   type = 'U')
   drop table PROPRIETARIOS
go

/*==============================================================*/
/* 3) CRIANDO AS TABELAS                                        */
/*==============================================================*/

create table COMPRADORES (
   CPF                  CHAR(11)             not null,
   DESCPREFERENCIAS     VARCHAR(100)         null,
   constraint PK_COMPRADORES primary key  (CPF)
)
go


create table CORRETORES (
   CPF                  CHAR(11)             not null,
   DATACONTRATACAO      DATETIME             not null,
   CRECI                VARCHAR(30)          not null,
   constraint PK_CORRETORES primary key  (CPF)
)
go


create table IMOVEIS (
   INSCRICAOIMOVEL      int                  not null,
   LOCALIZACAO          VARCHAR(100)         not null,
   AREATOTAL            DECIMAL(15,2)        null,
   PRECOVENDA           DECIMAL(15,2)        not null,
   constraint PK_IMOVEIS primary key  (INSCRICAOIMOVEL)
)
go


create table IMOVEISRURAIS (
   INSCRICAOIMOVEL      int                  not null,
   TIPO                 VARCHAR(100)         not null,
   constraint PK_IMOVEISRURAIS primary key  (INSCRICAOIMOVEL)
)
go


create table IMOVEISURBANOS (
   INSCRICAOIMOVEL      int                  not null,
   AREACONSTRUIDA       DECIMAL(15,2)        not null,
   HABITADO             BIT                  not null,
   constraint PK_IMOVEISURBANOS primary key  (INSCRICAOIMOVEL)
)
go


create table MELHORIASIMOVEISRURAIS (
   INSCRICAOIMOVEL      int                  null,
   DESCRICAO            VARCHAR(100)         not null
)
go


create table NEGOCIACOES (
   CORRETOR_CPF         CHAR(11)             not null,
   COMPRADOR_CPF        CHAR(11)             not null,
   INSCRICAOIMOVEL      int                  not null,
   constraint PK_NEGOCIACOES primary key  (CORRETOR_CPF, COMPRADOR_CPF, INSCRICAOIMOVEL)
)
go


create table PESSOAS (
   CPF                  CHAR(11)             not null,
   NOME                 VARCHAR(100)         not null,
   ENDERECO             VARCHAR(100)         null,
   constraint PK_PESSOAS primary key  (CPF)
)
go


create table PROPRIEDADES (
   CPF                  CHAR(11)             not null,
   INSCRICAOIMOVEL      int                  not null,
   constraint PK_PROPRIEDADES primary key  (CPF, INSCRICAOIMOVEL)
)
go


create table PROPRIETARIOS (
   CPF                  CHAR(11)             not null,
   TELEFONE             VARCHAR(14)          not null,
   constraint PK_PROPRIETARIOS primary key  (CPF)
)
go

/*==============================================================*/
/* 4) CRIANDO AS CONSTRAINTS DE FOREIGN KEY                     */
/*==============================================================*/

alter table COMPRADORES
   add constraint FK_COMPRADORES_PESSOAS foreign key (CPF)
      references PESSOAS (CPF)
go


alter table CORRETORES
   add constraint FK_CORRETORES_PESSOAS foreign key (CPF)
      references PESSOAS (CPF)
go


alter table IMOVEISRURAIS
   add constraint FK_IMOVEISRURAIS_IMOVEIS foreign key (INSCRICAOIMOVEL)
      references IMOVEIS (INSCRICAOIMOVEL)
go


alter table IMOVEISURBANOS
   add constraint FK_IMOVEISUURBANOS_IMOVEIS foreign key (INSCRICAOIMOVEL)
      references IMOVEIS (INSCRICAOIMOVEL)
go


alter table MELHORIASIMOVEISRURAIS
   add constraint FK_MELHORIAS_IMOVEISRURAIS foreign key (INSCRICAOIMOVEL)
      references IMOVEISRURAIS (INSCRICAOIMOVEL)
go


alter table NEGOCIACOES
   add constraint FK_NEGOCIACOES_COMPRADORES foreign key (COMPRADOR_CPF)
      references COMPRADORES (CPF)
go


alter table NEGOCIACOES
   add constraint FK_NEGOCIACOES_IMOVEIS foreign key (INSCRICAOIMOVEL)
      references IMOVEIS (INSCRICAOIMOVEL)
go


alter table NEGOCIACOES
   add constraint FK_NEGOCIACOES_CORRETORES foreign key (CORRETOR_CPF)
      references CORRETORES (CPF)
go


alter table PROPRIEDADES
   add constraint FK_PROPRIEDADES_PROPRIETARIOS foreign key (CPF)
      references PROPRIETARIOS (CPF)
go


alter table PROPRIEDADES
   add constraint FK_PROPRIEDADES_IMOVEIS foreign key (INSCRICAOIMOVEL)
      references IMOVEIS (INSCRICAOIMOVEL)
go


alter table PROPRIETARIOS
   add constraint FK_PROPRIETARIOS_PESSOAS foreign key (CPF)
      references PESSOAS (CPF)
go


