USE [PreClinic]
GO
/****** Object:  Table [dbo].[Departement]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departement](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[deptID] [varchar](50) NOT NULL,
	[deptName] [nvarchar](100) NULL,
	[description] [varchar](250) NULL,
	[hospID] [varchar](50) NULL,
	[actionDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Departement] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[sqn] [int] IDENTITY(1,1) NOT NULL,
	[docID] [nvarchar](50) NOT NULL,
	[docName] [nvarchar](100) NULL,
	[specID] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [varchar](20) NULL,
	[deptID] [varchar](10) NULL,
	[appointFee] [decimal](18, 0) NULL,
	[hasUser] [varchar](10) NULL,
	[status] [varchar](10) NULL,
	[userID] [varchar](10) NULL,
	[language] [varchar](10) NULL,
	[actionDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[docID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hospID] [varchar](50) NOT NULL,
	[hospName] [nvarchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](15) NULL,
	[address] [varchar](20) NULL,
	[currencySymbol] [nvarchar](1) NULL,
	[invoiceLogo] [varchar](100) NULL,
	[hospitalLogo] [varchar](100) NULL,
	[actionDate] [smalldatetime] NULL,
	[staffID] [varchar](50) NULL,
	[modifiedDate] [smalldatetime] NULL,
	[staffUpdated] [varchar](50) NULL,
 CONSTRAINT [PK_hospital] PRIMARY KEY CLUSTERED 
(
	[hospID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[roleID] [varchar](50) NOT NULL,
	[roleName] [varchar](50) NULL,
	[actionDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specialist]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialist](
	[sqn] [int] IDENTITY(1,1) NOT NULL,
	[specID] [nvarchar](50) NOT NULL,
	[specName] [nvarchar](100) NULL,
	[status] [nvarchar](10) NULL,
	[actionDate] [smalldatetime] NULL,
	[userID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specialist] PRIMARY KEY CLUSTERED 
(
	[specID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[staffID] [varchar](50) NOT NULL,
	[staffName] [nvarchar](100) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[deptID] [varchar](50) NULL,
	[roleID] [varchar](50) NULL,
	[staffTypeID] [varchar](50) NULL,
	[status] [varchar](10) NULL,
	[actionDate] [smalldatetime] NULL,
	[userCreated] [varchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffType]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffType](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[staffTypeID] [varchar](50) NOT NULL,
	[staffTypeName] [varchar](50) NULL,
	[actionDate] [smalldatetime] NULL,
 CONSTRAINT [PK_StaffType] PRIMARY KEY CLUSTERED 
(
	[staffTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GenerateID]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [GenerateID] 'SPC'
CREATE PROCEDURE [dbo].[GenerateID]
@type VARCHAR(20)
AS
BEGIN

	-- Specialist
	IF @type = 'SPC'
		BEGIN
			IF EXISTS(SELECT TOP 1 * FROM Specialist ORDER BY actionDate DESC)
				BEGIN
					DECLARE @MaxspecID INT
					SELECT @MaxspecID = MAX(CAST(SUBSTRING(specID, 4, LEN(specID)) AS INT))
					FROM Specialist WHERE ISNUMERIC(SUBSTRING(specID, 4, LEN(specID))) = 1

					SELECT 'SPC' + RIGHT('0000' + CAST(@MaxspecID + 1 AS VARCHAR(4)), 4) AS NewspecID
				END
			ELSE
				SELECT 'SPC0001' AS NewspecID
		END

	-- Doctor
	IF @type = 'DR'
		BEGIN
			IF EXISTS(SELECT TOP 1 * FROM Doctor ORDER BY actionDate DESC)
				BEGIN
					DECLARE @MaxdocID INT
					SELECT @MaxdocID = MAX(CAST(SUBSTRING(docID, 3, LEN(docID)) AS INT))
					FROM Doctor WHERE ISNUMERIC(SUBSTRING(docID, 3, LEN(docID))) = 1

					SELECT 'DR' + RIGHT('0000' + CAST(@MaxdocID + 1 AS VARCHAR(3)), 3) AS NewdocID
				END
			ELSE
				SELECT 'DR0001' AS NewdocID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[getAllSpec]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllSpec]
AS
BEGIN
	SELECT sqn,specID,specName,status,CONVERT(VARCHAR,actionDate,103) actionDate FROM Specialist ORDER BY sqn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SpecOperation]    Script Date: 12/27/2023 4:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[SpecOperation]
   @specID   NVARCHAR(50)
  ,@specName NVARCHAR(100)
  ,@status   NVARCHAR(10)
  ,@userID   VARCHAR(50)
  ,@op       CHAR(1)
  AS
  BEGIN
  		IF @op = 'I'
			BEGIN
				IF EXISTS(SELECT * FROM Specialist WHERE specName = @specName)
					BEGIN
						SELECT 'Error: Already Exists this Specialist!!' AS Msg
					END
				ELSE
					BEGIN

						CREATE TABLE #t (specID NVARCHAR(50))

						INSERT INTO #T (specID)
						EXEC [GenerateID] 'SPC'

						SELECT @specID = specID from #t

						INSERT INTO Specialist (specID,specName,[status],actionDate,userID)
						SELECT @specID,@specName,@status,GETDATE(),'ADM'
						SELECT 'Successfully Registered Specialist!!' AS Msg
					END
			END
		IF @op = 'U'
			BEGIN
				UPDATE Specialist SET specName = @specName, [status] = @status, userID = @userID WHERE specID = @specID
				SELECT 'Successfully Updated Specialist!!' AS Msg
			END
		IF @op = 'D'
			BEGIN
				IF EXISTS (SELECT * FROM Doctor WHERE specID = @specID)
				    BEGIN
						SELECT 'Error: This Specialist Exists in Doctors Table!!' AS Msg
					END
				ELSE 
					DELETE FROM Specialist WHERE specID = @specID
			END
  END
GO
