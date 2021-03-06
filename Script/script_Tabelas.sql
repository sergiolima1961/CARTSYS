USE [CartSys]
GO
/****** Object:  Table [dbo].[ATIVIDADE]    Script Date: 02/02/2021 10:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATIVIDADE](
	[ID_ATIVIDADE] [int] IDENTITY(1,1) NOT NULL,
	[ID_PROSPECTO] [int] NOT NULL,
	[DAT_ATIVIDADE] [datetime] NULL,
	[TIP_ATIVIDADE] [int] NOT NULL,
	[DSC_COMENTARIO] [varchar](1000) NULL,
	[STA_ATIVIDADE] [bit] NULL,
 CONSTRAINT [PK_ATIVIDADE] PRIMARY KEY NONCLUSTERED 
(
	[ID_ATIVIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CEPS]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEPS](
	[ID_CEP] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NULL,
	[LOGRADOURO] [varchar](50) NULL,
	[COMPLEMENTO] [varchar](20) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](40) NULL,
	[ESTADO] [varchar](2) NULL,
 CONSTRAINT [PK_CEP] PRIMARY KEY NONCLUSTERED 
(
	[ID_CEP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENDERECO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENDERECO](
	[ID_ENDERECO] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NULL,
	[LOGRADOURO] [varchar](50) NULL,
	[NUMERO] [varchar](10) NULL,
	[COMPLEMENTO] [varchar](20) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](40) NULL,
	[ESTADO] [varchar](2) NULL,
 CONSTRAINT [PK_ENDERECO] PRIMARY KEY NONCLUSTERED 
(
	[ID_ENDERECO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTIDADE]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTIDADE](
	[ID_ENTIDADE] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](90) NULL,
	[EMAIL] [varchar](100) NULL,
	[TELEFONE] [varchar](16) NULL,
	[CELULAR] [varchar](16) NULL,
	[TIPO_ENTIDADE] [int] NULL,
	[ID_USUARIO] [int] NULL,
	[STATUS] [bit] NULL,
	[ID_ENDERECO] [int] NULL,
 CONSTRAINT [PK_ENTIDADE] PRIMARY KEY NONCLUSTERED 
(
	[ID_ENTIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGSYS]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGSYS](
	[ID_LOGSYS] [int] IDENTITY(1,1) NOT NULL,
	[DS_LOGSYS] [varchar](200) NULL,
	[DS_ACAO] [varchar](20) NULL,
	[DT_LOGSYS] [datetime] NULL,
 CONSTRAINT [PK_LOGSYS] PRIMARY KEY NONCLUSTERED 
(
	[ID_LOGSYS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROSPECTO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROSPECTO](
	[ID_PROSPECTO] [int] IDENTITY(1,1) NOT NULL,
	[ID_ENTIDADE] [int] NOT NULL,
	[DAT_PROSPECTO] [datetime] NULL,
	[ID_USUARIO] [int] NOT NULL,
	[TIP_PROSPECTO] [smallint] NULL,
	[STA_PROSPECTO] [bit] NULL,
 CONSTRAINT [PK_PROSPECTO] PRIMARY KEY NONCLUSTERED 
(
	[ID_PROSPECTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NOT NULL,
	[LOGIN] [varchar](20) NOT NULL,
	[SENHA] [varchar](30) NOT NULL,
	[STATUS] [bit] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY NONCLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATIVIDADE] ADD  DEFAULT (getdate()) FOR [DAT_ATIVIDADE]
GO
ALTER TABLE [dbo].[ATIVIDADE] ADD  DEFAULT ((1)) FOR [TIP_ATIVIDADE]
GO
ALTER TABLE [dbo].[ATIVIDADE] ADD  DEFAULT ((1)) FOR [STA_ATIVIDADE]
GO
ALTER TABLE [dbo].[ENTIDADE] ADD  DEFAULT ((300)) FOR [TIPO_ENTIDADE]
GO
ALTER TABLE [dbo].[ENTIDADE] ADD  DEFAULT ((0)) FOR [STATUS]
GO
ALTER TABLE [dbo].[LOGSYS] ADD  DEFAULT ('INCLUSÃO') FOR [DS_ACAO]
GO
ALTER TABLE [dbo].[LOGSYS] ADD  DEFAULT (getdate()) FOR [DT_LOGSYS]
GO
ALTER TABLE [dbo].[PROSPECTO] ADD  DEFAULT (getdate()) FOR [DAT_PROSPECTO]
GO
ALTER TABLE [dbo].[PROSPECTO] ADD  DEFAULT ((1)) FOR [TIP_PROSPECTO]
GO
ALTER TABLE [dbo].[PROSPECTO] ADD  DEFAULT ((1)) FOR [STA_PROSPECTO]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[ATIVIDADE]  WITH CHECK ADD  CONSTRAINT [FK_ATIVIDADE_ID_PROSPECTO] FOREIGN KEY([ID_PROSPECTO])
REFERENCES [dbo].[PROSPECTO] ([ID_PROSPECTO])
GO
ALTER TABLE [dbo].[ATIVIDADE] CHECK CONSTRAINT [FK_ATIVIDADE_ID_PROSPECTO]
GO
ALTER TABLE [dbo].[ENTIDADE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_ID_ENDERECO] FOREIGN KEY([ID_ENDERECO])
REFERENCES [dbo].[ENDERECO] ([ID_ENDERECO])
GO
ALTER TABLE [dbo].[ENTIDADE] CHECK CONSTRAINT [FK_ENDERECO_ID_ENDERECO]
GO
ALTER TABLE [dbo].[PROSPECTO]  WITH CHECK ADD  CONSTRAINT [FK_PROSPECTO_ID_ENTIDADE] FOREIGN KEY([ID_ENTIDADE])
REFERENCES [dbo].[ENTIDADE] ([ID_ENTIDADE])
GO
ALTER TABLE [dbo].[PROSPECTO] CHECK CONSTRAINT [FK_PROSPECTO_ID_ENTIDADE]
GO
ALTER TABLE [dbo].[PROSPECTO]  WITH CHECK ADD  CONSTRAINT [FK_PROSPECTO_ID_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[PROSPECTO] CHECK CONSTRAINT [FK_PROSPECTO_ID_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ATIVIDADE]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:  sergio lima
-- Create date: 27/04/2021
-- Description: Atividade CRM
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ATIVIDADE](@ACAO            CHAR(1) ='C'
                                          ,@ID_ATIVIDADE   [INT]
                                          ,@ID_PROSPECTO   [INT]
                                          ,@DAT_ATIVIDADE  [DATETIME]
                                          ,@TIP_ATIVIDADE  [INT]
                                          ,@DSC_COMENTARIO [VARCHAR](1000)
                                          ,@STA_ATIVIDADE  [BIT])
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @ID_USUARIO INT

      IF @ACAO = 'I'
        BEGIN
            INSERT INTO [DBO].[ATIVIDADE]
                        ([ID_PROSPECTO]
                         ,[TIP_ATIVIDADE]
                         ,DAT_ATIVIDADE
                         ,[DSC_COMENTARIO])
            VALUES      ( @ID_PROSPECTO
                          ,@TIP_ATIVIDADE
                          ,@DAT_ATIVIDADE
                          ,@DSC_COMENTARIO )
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE [DBO].[ATIVIDADE]
            SET    [TIP_ATIVIDADE] = @TIP_ATIVIDADE
                   ,[DSC_COMENTARIO] = @DSC_COMENTARIO
                   ,DAT_ATIVIDADE = @DAT_ATIVIDADE
            WHERE  ID_ATIVIDADE = @ID_ATIVIDADE
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[ATIVIDADE]
            WHERE  ID_ATIVIDADE = @ID_ATIVIDADE
        END
      ELSE IF @ACAO = 'G'
        BEGIN
            SELECT TOP 1 @ID_USUARIO = PRO.ID_USUARIO
            FROM   PROSPECTO PRO
            WHERE  PRO.ID_PROSPECTO = @ID_PROSPECTO

            --
            SELECT ATI.[ID_ATIVIDADE]
                   ,ATI.[ID_PROSPECTO]
                   ,ATI.[DAT_ATIVIDADE]
                   ,ATI.[DSC_COMENTARIO]
                   ,ATI.[STA_ATIVIDADE]
                   ,CHOOSE (ATI.[TIP_ATIVIDADE], 'Telefonema', 'E-mail', 'visita ao possível cliente', 'visita do possível cliente à empresa') [Atividade]
            FROM   PROSPECTO PRO
                   INNER JOIN [DBO].[ATIVIDADE] ATI
                           ON ATI.ID_PROSPECTO = PRO.ID_PROSPECTO
            WHERE  PRO.ID_PROSPECTO = @ID_PROSPECTO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ATI.[ID_ATIVIDADE]                                                                                                             [IDA]
                   ,ATI.[DAT_ATIVIDADE]                                                                                                           [Data]
                   ,ATI.[TIP_ATIVIDADE]
                   ,CHOOSE (ATI.[TIP_ATIVIDADE], 'Telefonema', 'E-mail', 'visita ao possível cliente', 'visita do possível cliente à empresa') [Atividade]
                   ,ATI.[DSC_COMENTARIO]                                                                                                          [Comentário]
                   ,ATI.[STA_ATIVIDADE]
                   ,ATI.ID_PROSPECTO
            FROM   [DBO].[ATIVIDADE] ATI
            WHERE  ATI.ID_PROSPECTO = @ID_PROSPECTO
            ORDER  BY ATI.DAT_ATIVIDADE DESC
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CEPS]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 25/01/2021
-- Description:	cadastro de entidade 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_CEPS](@ACAO             CHAR(1)='C'
                                      ,@ID_CEPS         [INT]
                                      ,@CEP             [VARCHAR](8)
                                      ,@LOGRADOURO      [VARCHAR](50)
                                      ,@COMPLEMENTO     [VARCHAR](20)
                                      ,@BAIRRO          [VARCHAR](30)
                                      ,@CIDADE          [VARCHAR](40)
                                      ,@ESTADO          [VARCHAR](2) )
AS
  BEGIN
      SET NOCOUNT ON;

      IF @ACAO = 'I'
        BEGIN
            INSERT [DBO].[CEPS]
                   ([CEP]
                    ,[LOGRADOURO]
                    ,[COMPLEMENTO]
                    ,[BAIRRO]
                    ,[CIDADE]
                    ,[ESTADO] )
            VALUES (@CEP
                    ,@LOGRADOURO
                    ,@COMPLEMENTO
                    ,@BAIRRO
                    ,@CIDADE
                    ,@ESTADO )
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE [DBO].[CEPS]
            SET    [CEP] = @CEP
                   ,[LOGRADOURO] = @LOGRADOURO
                   ,[COMPLEMENTO] = @COMPLEMENTO
                   ,[BAIRRO] = @BAIRRO
                   ,[CIDADE] = @CIDADE
                   ,[ESTADO] = @ESTADO
            WHERE  ID_CEP = @ID_CEPS
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[CEPS]
            WHERE  ID_CEP = @ID_CEPS
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT [ID_CEP] [ID]
                   ,[CEP]
                   ,[LOGRADOURO]
                   ,[COMPLEMENTO]
                   ,[BAIRRO]
                   ,[CIDADE]
                   ,[ESTADO]
            FROM   [DBO].[CEPS]
            WHERE  CEP = @CEP
        END
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ENDERECO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 25/01/2021
-- Description:	cadastro de entidade 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ENDERECO](@ACAO             CHAR(1)='C'
                                         ,@ID_ENDERECO     [INT]
                                         ,@CEP             [VARCHAR](8)
                                         ,@LOGRADOURO      [VARCHAR](50)
                                         ,@NUMERO          [VARCHAR](10)
                                         ,@COMPLEMENTO     [VARCHAR](20)
                                         ,@BAIRRO          [VARCHAR](30)
                                         ,@CIDADE          [VARCHAR](40)
                                         ,@ESTADO          [VARCHAR](2)
                                         ,@ID_RETORN       INT OUTPUT)
AS
  BEGIN
      SET NOCOUNT ON;
                  DECLARE @ID_CEPS INT  =0


      IF @ACAO = 'I'
        BEGIN
            /*
              CADASTRO DE CEPS		
            */
            IF NOT EXISTS(SELECT 1
                          FROM   CEPS C
                          WHERE  C.CEP = @CEP)
              BEGIN

                  EXECUTE [DBO].[SP_IAEC_CEPS]
                    @ACAO,
                    @ID_CEPS,
                    @CEP,
                    @LOGRADOURO,
                    @COMPLEMENTO,
                    @BAIRRO,
                    @CIDADE,
                    @ESTADO;
              END

            INSERT [DBO].[ENDERECO]
                   ([CEP]
                    ,[LOGRADOURO]
                    ,[NUMERO]
                    ,[COMPLEMENTO]
                    ,[BAIRRO]
                    ,[CIDADE]
                    ,[ESTADO]
                     )
            VALUES (@CEP
                    ,@LOGRADOURO
                    ,@NUMERO
                    ,@COMPLEMENTO
                    ,@BAIRRO
                    ,@CIDADE
                    ,@ESTADO
                     )

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            /*
              CADASTRO DE CEPS		
            */
            IF NOT EXISTS(SELECT 1
                          FROM   CEPS C
                          WHERE  C.CEP = @CEP)
              BEGIN
                  EXECUTE [DBO].[SP_IAEC_CEPS]
                    'I',
                    @ID_CEPS,
                    @CEP,
                    @LOGRADOURO,
                    @COMPLEMENTO,
                    @BAIRRO,
                    @CIDADE,
                    @ESTADO;
              END

            UPDATE [DBO].[ENDERECO]
            SET    [CEP] = @CEP
                   ,[LOGRADOURO] = @LOGRADOURO
                   ,[NUMERO] = @NUMERO
                   ,[COMPLEMENTO] = @COMPLEMENTO
                   ,[BAIRRO] = @BAIRRO
                   ,[CIDADE] = @CIDADE
                   ,[ESTADO] = @ESTADO
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT [ID_ENDERECO] [ID]
                   ,[CEP]
                   ,[LOGRADOURO]
                   ,[NUMERO]
                   ,[COMPLEMENTO]
                   ,[BAIRRO]
                   ,[CIDADE]
                   ,[ESTADO]
            FROM   [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ENTIDADE]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 25/01/2021
-- Description:	cadastro de entidade 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ENTIDADE](@ACAO           CHAR(1)='C'
                                         ,@ID_ENTIDADE   [INT]
                                         ,@NOME          [VARCHAR](90)
                                         ,@EMAIL         [VARCHAR](100)
                                         ,@TELEFONE      [VARCHAR](16)
                                         ,@CELULAR       [VARCHAR](16)
                                         ,@TIPO_ENTIDADE [INT] = 100
                                         ,@ID_USUARIO    [INT]
                                         ,@STATUS        [BIT]
                                         ,@ID_ENDERECO   [INT]
                                         ,@CEP           [VARCHAR](8)
                                         ,@LOGRADOURO    [VARCHAR](50)
                                         ,@NUMERO        [VARCHAR](10)
                                         ,@COMPLEMENTO   [VARCHAR](20)
                                         ,@BAIRRO        [VARCHAR](30)
                                         ,@CIDADE        [VARCHAR](40)
                                         ,@ESTADO        [VARCHAR](2)
                                         ,@ID_RETORN     INT)
AS
  BEGIN
      DECLARE @PESQUISA VARCHAR(150)='',
              @MOVIMENTO VARCHAR(200) =''

      SET @MOVIMENTO = CONCAT('Tabela ENTIDADE ' ,'Feito Pelo usuario ', (SELECT US.NOME
                                                      FROM   DBO.USUARIO US
                                                      WHERE  US.ID_USUARIO = @ID_USUARIO),' Registro :' ,@ID_ENTIDADE);

      /*
        Log
      */
      IF @ACAO IN ( 'i', 'A', 'E' )
        BEGIN
            EXECUTE [DBO].[SP_IC_LOGSYS]
              @ACAO,
              @MOVIMENTO
        END;

      SET NOCOUNT ON;

      IF @ACAO = 'I'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN OUTPUT

            SET @ID_ENDERECO = @@IDENTITY;

            /*
             Cadastro de Contatos
            */
            INSERT ENTIDADE
                   ([NOME]
                    ,[EMAIL]
                    ,[TELEFONE]
                    ,[CELULAR]
                    ,[TIPO_ENTIDADE]
                    ,[ID_USUARIO]
                    ,[ID_ENDERECO])
            VALUES(@NOME
                   ,@EMAIL
                   ,@TELEFONE
                   ,@CELULAR
                   ,@TIPO_ENTIDADE
                   ,@ID_USUARIO
                   ,@ID_ENDERECO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN OUTPUT

            /*
              contrato 
            */
            UPDATE [DBO].[ENTIDADE]
            SET    [NOME] = @NOME
                   ,[EMAIL] = @EMAIL
                   ,[TELEFONE] = @TELEFONE
                   ,[CELULAR] = @CELULAR
                   ,[TIPO_ENTIDADE] = @TIPO_ENTIDADE
                   ,[ID_USUARIO] = @ID_USUARIO
                   ,[STATUS] = @STATUS
                   ,[ID_ENDERECO] = @ID_ENDERECO
            WHERE  ID_ENTIDADE = @ID_ENTIDADE;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            UPDATE [DBO].[ENTIDADE]
            SET    [STATUS] = @STATUS
            WHERE  ID_ENTIDADE = @ID_ENTIDADE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ENT.ID_ENTIDADE                             [ID]
                   ,ENT.NOME                                   [Contato]
                   ,ENT.EMAIL                                  [E-mail]
                   ,ENT.TELEFONE                               [Telefone]
                   ,ENT.CELULAR                                [Celular]
                   ,ENT.TIPO_ENTIDADE                          [Tipo]
                   ,ENT.ID_USUARIO                             [Use]
                   ,IIF(ENT.STATUS = 1, 'Desativado', 'Ativo') [Sta]
                   ,ENT.STATUS
                   ,ENT.ID_ENDERECO
                   ,ED.CEP
                   ,ED.LOGRADOURO
                   ,ED.NUMERO
                   ,ED.COMPLEMENTO
                   ,ED.BAIRRO
                   ,ED.CIDADE
                   ,ED.ESTADO
            FROM   [DBO].[ENTIDADE] ENT (NOLOCK)
                   LEFT JOIN ENDERECO ED
                          ON ED.[ID_ENDERECO] = ENT.ID_ENDERECO
            WHERE  ENT.ID_USUARIO = @ID_USUARIO
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @NOME
            SET @PESQUISA += '%'

            SELECT [ID_ENTIDADE] [ID]
                   ,NOME         [Contato]
            FROM   [DBO].[ENTIDADE] (NOLOCK)
            WHERE  NOME LIKE @PESQUISA
                   AND ID_USUARIO = @ID_USUARIO
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PROSPECTO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 27/04/2021
-- Description:	prospecto CRM
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_PROSPECTO](@ACAO           CHAR(1)
                                          ,@ID_PROSPECTO  [INT]
                                          ,@ID_ENTIDADE   [INT]
                                          ,@DAT_PROSPECTO [DATETIME]
                                          ,@ID_USUARIO    [INT]
                                          ,@TIP_PROSPECTO [SMALLINT]
                                          ,@STA_PROSPECTO [BIT]
                                          ,@DSC_CONTATO   VARCHAR(200)=''
                                          ,@RET_BUSCA     INT = 0)
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @PESQUISA  VARCHAR(200)='',
              @MOVIMENTO VARCHAR(200) =''

      IF @ACAO = 'I'
        BEGIN
            INSERT [DBO].[PROSPECTO]
                   (ID_ENTIDADE
                    ,ID_USUARIO)
            VALUES (@ID_ENTIDADE
                    ,@ID_USUARIO );

            SET @ID_PROSPECTO = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE [DBO].[PROSPECTO]
            SET    [ID_ENTIDADE] = @ID_ENTIDADE
                   ,DAT_PROSPECTO = Getdate()
            WHERE  ID_PROSPECTO = @ID_PROSPECTO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            UPDATE [DBO].[PROSPECTO]
            SET    STA_PROSPECTO = @STA_PROSPECTO
                   ,DAT_PROSPECTO = Getdate()
            WHERE  ID_PROSPECTO = @ID_PROSPECTO
        END
      ELSE IF @ACAO = 'S'
        BEGIN
            UPDATE [DBO].[PROSPECTO]
            SET    TIP_PROSPECTO = @TIP_PROSPECTO
                   ,DAT_PROSPECTO = Getdate()
            WHERE  ID_PROSPECTO = @ID_PROSPECTO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT PRO.[ID_PROSPECTO]                                                                                                                     [ID]
                   ,PRO.[ID_ENTIDADE]
                   ,ENT.NOME                                                                                                                              [Contato]
                   ,PRO.[DAT_PROSPECTO]                                                                                                                   [Data]
                   ,PRO.[ID_USUARIO]
                   ,PRO.[TIP_PROSPECTO]
                   ,PRO.[STA_PROSPECTO]
                   ,CHOOSE (( PRO.[TIP_PROSPECTO] ), 'Suspeito / Conscientização', 'Prospecto / interesse', 'Qualificado / Desejo', 'Cliente / Ação') [Atividades]
                   ,IIF(PRO.[STA_PROSPECTO] = 1, 'Ativo', 'Desativado')                                                                                   [Situacao]
            FROM   [DBO].[PROSPECTO] PRO
                   INNER JOIN ENTIDADE ENT
                           ON ENT.ID_ENTIDADE = PRO.ID_ENTIDADE
                              AND ENT.ID_USUARIO = PRO.ID_USUARIO
            WHERE  PRO.ID_USUARIO = @ID_USUARIO
                   AND PRO.[TIP_PROSPECTO] = @TIP_PROSPECTO
            ORDER  BY PRO.[TIP_PROSPECTO]
                      ,1 DESC
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            IF @RET_BUSCA = 1
              BEGIN
                  SET @PESQUISA = '%'
                  SET @PESQUISA += @DSC_CONTATO
                  SET @PESQUISA += '%'

                  SELECT PRO.[ID_PROSPECTO]                                                                                                                     [ID]
                         ,PRO.[ID_ENTIDADE]
                         ,ENT.NOME                                                                                                                              [Contato]
                         ,PRO.[DAT_PROSPECTO]                                                                                                                   [Data]
                         ,PRO.[ID_USUARIO]
                         ,PRO.[TIP_PROSPECTO]
                         ,PRO.[STA_PROSPECTO]
                         ,CHOOSE (( PRO.[TIP_PROSPECTO] ), 'Suspeito / Conscientização', 'Prospecto / interesse', 'Qualificado / Desejo', 'Cliente / Ação') [Atividades]
                         ,IIF(PRO.[STA_PROSPECTO] = 1, 'Ativo', 'Desativado')                                                                                   [Situacao]
                  FROM   [DBO].[PROSPECTO] PRO
                         INNER JOIN ENTIDADE ENT
                                 ON ENT.ID_ENTIDADE = PRO.ID_ENTIDADE
                                    AND ENT.ID_USUARIO = PRO.ID_USUARIO
                  WHERE  PRO.ID_USUARIO = @ID_USUARIO
                         AND ENT.NOME LIKE @PESQUISA
                  ORDER  BY 1 DESC
              END
            ELSE IF @RET_BUSCA = 2
              BEGIN
                  SET @PESQUISA =''
                  SET @PESQUISA += @DSC_CONTATO
                  SET @PESQUISA +=''

                  SELECT PRO.[ID_PROSPECTO]                                                                                                                     [ID]
                         ,PRO.[ID_ENTIDADE]
                         ,ENT.NOME                                                                                                                              [Contato]
                         ,PRO.[DAT_PROSPECTO]                                                                                                                   [Data]
                         ,PRO.[ID_USUARIO]
                         ,PRO.[TIP_PROSPECTO]
                         ,PRO.[STA_PROSPECTO]
                         ,CHOOSE (( PRO.[TIP_PROSPECTO] ), 'Suspeito / Conscientização', 'Prospecto / interesse', 'Qualificado / Desejo', 'Cliente / Ação') [Atividades]
                         ,IIF(PRO.[STA_PROSPECTO] = 1, 'Ativo', 'Desativado')                                                                                   [Situacao]
                  FROM   [DBO].[PROSPECTO] PRO
                         INNER JOIN ENTIDADE ENT
                                 ON ENT.ID_ENTIDADE = PRO.ID_ENTIDADE
                                    AND ENT.ID_USUARIO = PRO.ID_USUARIO
                  WHERE  PRO.ID_USUARIO = @ID_USUARIO
                         AND CONVERT(DATE, PRO.[DAT_PROSPECTO]) = CONVERT(DATE, @PESQUISA)
                  ORDER  BY 1 DESC
              END
        END
      ELSE IF @ACAO = 'G'
        BEGIN
            SELECT Count(PRO.[ID_ENTIDADE]) [Frequencia]
                   ,LOC.ESTADO              Localidade
            FROM   [CARTSYS].[DBO].[PROSPECTO] PRO
                   INNER JOIN DBO.ENTIDADE ETI
                           ON ETI.ID_ENTIDADE = PRO.ID_ENTIDADE
                   INNER JOIN DBO.ENDERECO LOC
                           ON LOC.ID_ENDERECO = ETI.ID_ENDERECO
                              AND ETI.ID_USUARIO = PRO.ID_USUARIO
            WHERE  PRO.ID_USUARIO = @ID_USUARIO
			  AND PRO.[TIP_PROSPECTO] = 4
            GROUP  BY LOC.ESTADO
        END
      ELSE IF @ACAO = 'B'
        BEGIN
            IF ISNULL(@TIP_PROSPECTO, 0) = 0
              BEGIN
                  SELECT PRO.[ID_PROSPECTO]                                                                                                                     [ID]
                         ,PRO.[ID_ENTIDADE]
                         ,ENT.NOME                                                                                                                              [Contato]
                         ,PRO.[DAT_PROSPECTO]                                                                                                                   [Data]
                         ,PRO.[ID_USUARIO]
                         ,PRO.[TIP_PROSPECTO]
                         ,PRO.[STA_PROSPECTO]
                         ,CHOOSE (( PRO.[TIP_PROSPECTO] ), 'Suspeito / Conscientização', 'Prospecto / interesse', 'Qualificado / Desejo', 'Cliente / Ação') [Atividades]
                         ,IIF(PRO.[STA_PROSPECTO] = 1, 'Ativo', 'Desativado')                                                                                   [Situacao]
                  FROM   [DBO].[PROSPECTO] PRO
                         INNER JOIN ENTIDADE ENT
                                 ON ENT.ID_ENTIDADE = PRO.ID_ENTIDADE
                                    AND ENT.ID_USUARIO = PRO.ID_USUARIO
                  WHERE  PRO.ID_USUARIO = @ID_USUARIO
                  ORDER  BY PRO.[TIP_PROSPECTO]
                            ,1 DESC
              END
            ELSE
              BEGIN
                  SELECT PRO.[ID_PROSPECTO]                                                                                                                     [ID]
                         ,PRO.[ID_ENTIDADE]
                         ,ENT.NOME                                                                                                                              [Contato]
                         ,PRO.[DAT_PROSPECTO]                                                                                                                   [Data]
                         ,PRO.[ID_USUARIO]
                         ,PRO.[TIP_PROSPECTO]
                         ,PRO.[STA_PROSPECTO]
                         ,CHOOSE (( PRO.[TIP_PROSPECTO] ), 'Suspeito / Conscientização', 'Prospecto / interesse', 'Qualificado / Desejo', 'Cliente / Ação') [Atividades]
                         ,IIF(PRO.[STA_PROSPECTO] = 1, 'Ativo', 'Desativado')                                                                                   [Situacao]
                  FROM   [DBO].[PROSPECTO] PRO
                         INNER JOIN ENTIDADE ENT
                                 ON ENT.ID_ENTIDADE = PRO.ID_ENTIDADE
                                    AND ENT.ID_USUARIO = PRO.ID_USUARIO
                  WHERE  PRO.ID_USUARIO = @ID_USUARIO
                         AND PRO.ID_PROSPECTO = @ID_PROSPECTO
                  ORDER  BY PRO.[TIP_PROSPECTO]
                            ,1 DESC
              END
        END

      /*
      
      */
      SET @MOVIMENTO = CONCAT('Tabela PROSPECTO ', 'Feito Pelo usuario ( ', @ID_USUARIO, ' ) ', (SELECT US.NOME
                                                                                                 FROM   DBO.USUARIO US
                                                                                                 WHERE  US.ID_USUARIO = @ID_USUARIO), ' Registro :', @ID_PROSPECTO);

      /*
        Log
      */
      IF @ACAO IN ( 'i', 'A', 'E' )
        BEGIN
            EXECUTE [DBO].[SP_IC_LOGSYS]
              @ACAO,
              @MOVIMENTO
        END;
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_USUARIO]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 25/01/2021
-- Description:	cadastro de USUARIO
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_USUARIO](@ACAO        CHAR(1)='C'
                                        ,@ID_USUARIO [INT]
                                        ,@NOME       [VARCHAR](90)
                                        ,@LOGIN      [VARCHAR](30)
                                        ,@SENHA      [VARCHAR](16)
                                        ,@ATIVO      [BIT]
                                        ,@ID_RETORN  INT)
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @MOVIMENTO VARCHAR(200) =''

      IF @ACAO = 'I'
        BEGIN
            /*
             Cadastro de Contatos
            */
            INSERT [DBO].[USUARIO]
                   ([NOME]
                    ,[LOGIN]
                    ,[SENHA]
                    ,[STATUS])
            VALUES (@NOME
                    ,@LOGIN
                    ,@SENHA
                    ,1)

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE [DBO].[USUARIO]
            SET    [NOME] = @NOME
                   ,[LOGIN] = @LOGIN
                   ,[SENHA] = @SENHA
                   ,[STATUS] = ISNULL(@ATIVO, 1)
            WHERE  ID_USUARIO = @ID_USUARIO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            UPDATE [DBO].[USUARIO]
            SET    [STATUS] = @ATIVO
            WHERE  ID_USUARIO = @ID_USUARIO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_USUARIO                              [ID]
                   ,NOME                                   [Usuario]
                   ,LOGIN                                  [Login]
                   ,SENHA                                  [Senha]
                   ,IIF(STATUS = 1, 'Ativo', 'Desativado') [Situacao]
                   ,STATUS                                 [STATUS]
            FROM   USUARIO
        END
      ELSE IF @ACAO = 'S'
        BEGIN
            SELECT ID_USUARIO                              [ID]
                   ,NOME                                   [Usuario]
                   ,IIF(STATUS = 1, 'Ativo', 'Desativado') [Situacao]
                   ,STATUS                                 [STATUS]
            FROM   USUARIO US
            WHERE  US.LOGIN = @LOGIN
                   AND US.SENHA = @SENHA;
        END

      SET @MOVIMENTO = CONCAT('Tabela Usuario ', 'Feito Pelo usuario ', (SELECT US.NOME
                                                                         FROM   DBO.USUARIO US
                                                                         WHERE  US.ID_USUARIO = @ID_USUARIO), ' Registro :', @ID_USUARIO);

      /*
        Log
      */
      IF @ACAO IN ( 'i', 'A', 'E' )
        BEGIN
            EXECUTE [DBO].[SP_IC_LOGSYS]
              @ACAO,
              @MOVIMENTO
        END;
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IC_LOGSYS]    Script Date: 02/02/2021 10:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IC_LOGSYS] (@ACAO          CHAR(1) ='C'
                                      ,@DS_ATIVIDADE [VARCHAR](200))
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @DS_ACAO VARCHAR(20)

      SELECT @DS_ACAO = CASE
                          WHEN @ACAO = 'I' THEN 'Inclusão'
                          WHEN @ACAO = 'A' THEN 'Alteração'
                          ELSE 'Exclusão'
                        END

      IF @ACAO IN ( 'I', 'A', 'E' )
        BEGIN
            INSERT [DBO].[LOGSYS]
                   ([DS_LOGSYS]
                    ,[DS_ACAO])
            VALUES (@DS_ATIVIDADE
                    ,@DS_ACAO )
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT TOP (1000) [ID_LOGSYS]
                              ,[DS_LOGSYS]
                              ,[DS_ACAO]
                              ,[DT_LOGSYS]
            FROM   [DBO].[LOGSYS]
            ORDER  BY [DT_LOGSYS] DESC
        END
  END 
GO
