/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_EmployeeTitle1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coffee]') AND type in (N'U'))
ALTER TABLE [dbo].[Coffee] DROP CONSTRAINT IF EXISTS [FK_Coffee_CoffeeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coffee]') AND type in (N'U'))
ALTER TABLE [dbo].[Coffee] DROP CONSTRAINT IF EXISTS [FK_Coffee_CoffeeSupplier]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coffee]') AND type in (N'U'))
ALTER TABLE [dbo].[Coffee] DROP CONSTRAINT IF EXISTS [FK_Coffee_CoffeeStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[EmployeeTitle]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[EmployeeTitle]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[CoffeeType]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[CoffeeType]
GO
/****** Object:  Table [dbo].[CoffeeSupplier]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[CoffeeSupplier]
GO
/****** Object:  Table [dbo].[CoffeeStatus]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[CoffeeStatus]
GO
/****** Object:  Table [dbo].[Coffee]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Coffee]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:20 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Coffee]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coffee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Coffee](
	[CoffeeID] [int] IDENTITY(1,1) NOT NULL,
	[CoffeeName] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CoffeeStatusID] [int] NOT NULL,
	[SupplierID] [int] NULL,
	[Images] [nvarchar](50) NULL,
	[Country] [nvarchar](25) NULL,
	[Region] [nvarchar](25) NULL,
 CONSTRAINT [PK_Coffee] PRIMARY KEY CLUSTERED 
(
	[CoffeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CoffeeStatus]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoffeeStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoffeeStatus](
	[CoffeeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_CoffeeStatus] PRIMARY KEY CLUSTERED 
(
	[CoffeeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CoffeeSupplier]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoffeeSupplier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoffeeSupplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Images] [nvarchar](50) NULL,
	[Region] [nvarchar](25) NULL,
	[Country] [nvarchar](25) NULL,
 CONSTRAINT [PK_CoffeeSupplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CoffeeType]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoffeeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoffeeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_CoffeeType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstN] [nvarchar](20) NOT NULL,
	[LastN] [nvarchar](20) NOT NULL,
	[IsMember] [bit] NOT NULL,
	[Address] [nvarchar](20) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstN] [nvarchar](20) NOT NULL,
	[LastN] [nvarchar](20) NOT NULL,
	[TitleID] [int] NULL,
	[BirthDate] [varchar](10) NOT NULL,
	[HireDate] [varchar](10) NULL,
	[Address] [nvarchar](25) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Images] [nvarchar](50) NULL,
	[Phone] [nvarchar](12) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmployeeTitle]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeTitle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeTitle](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_EmployeeTitle] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[FavoriteColor] [varchar](7) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108310238342_InitialCreate', N'StoreFront.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85B649DA40DBAB9609D2CFAB6A025DA1156A2B412952628FA657DE827F5173A94A81B2FBAD88AED14058A581C9E190E67C8E170B8FFFEFDCFF8E747DF331E7014BB01999807A37DD3C0C40E1C972C27664217AFDE9A3FBFFBF69BF199E33F1A9F72BA2346073D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF641D1C5818204CC0328CF1C78450D7C7E90FF8390D888D439A20EF3270B017F3EFD0324B518D2BE4E33844369E98331A44F83C0A081DDD5D8C2E3F4D47591FD338F15C04F2CCB0B7300D4448401105698FEF623CA3D061390BE103F26E9F420C740BE4C5988FE2B824EF3AA0FD433620ABEC9843D9494C03BF27E0C111D79025765F49CF66A141D0E119E89A3EB151A77A9C98170E4E3F7D0C3C5080C8F078EA458C78625E162C4EE2F00AD351DE7194419E4700F747107D195511F78CCEFDF60A8B3A1CEDB3FFF68C69E2D124C21382131A216FCFB849E69E6BFF869F6E832F984C8E0EE68BA3B7AFDF20E7E8CD8FF8E87575A43056A0AB7D804F375110E20864C38B62FCA661D5FB5962C7A25BA54FA615B025700ED3B8448F1F3059D27B709BC3B7A671EE3E6227FFC28DEB8EB8E04BD0894609FCBC4A3C0FCD3D5CB45B8D3CD9FF1BB81EBE7E3308D72BF4E02ED3A917F883E344E0571FB197B6C6F76E98B9576DBE3F7332F0499FFDAEDB57D6FA79162491CD061368496E51B4C4B42EDDD82A8DB7934933A8E1CD3A47DD7DD36692CAE6AD2465035AC51372169BF6865CDEE7E5DBD9E24EC210262F352DA6912683D36D59230163CF90284B333AE86A460486F77F5E15CF7CE47A032C8B1DB8405CB270231F17A37C1F801122D25BE61B14C7B02A38BFA2F8BE4174F87300D167D84E2230D619457EF8ECDC6EEE0382AF127FCE7C6073BC069B9ADB3F82736483DF9D11D66B6DBC0F81FD2548E819714E11C577D4CE01D9CF5BD7EF0E30883827B68DE3F81C8C193BD300C2EE1CF082D0A3C3DE706C99DA765832F590EBABE3126141FD9C9396B1899A428A4F3464AA18A549D40FC1D225DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D560515F3A43C3877D29ECEEC77DEB6DDEBAB5A0A2C63432F905131CC132E6DC204A7144CA19E8B26E6C235848A78F317DF6BD29E5F40979C9D0AC56F286741118DE1B52D8DDF786544CF8FCE03A2C2AE97018CA8901BE13BDFA9CD5EE7382649B7687DA3037CD7C336B80CE5D4EE238B0DDD40B1469309EC4A8CB0F319CD19ED1C846236645606060E82EDBF2E00B8CCD148DEA9A9C620F536C9CD8599A708A621B39B21A61404E0FC1F21D552158991DA90BF783C4132C1D47AC136287A0183CD52554760B97D86E88BC562D093D3B6E616CEC050FB1E51487983086AD9AE8C25C9D0C6102147C844969D3D0D8AA585CB3216AA256DD9CB785B0E5BC4B398A8DD8644BECACB14B1EBF3D8B61366B6C03C6D9AC922E0268137BDB30507E56E96A00E2C165D70C543831690C9487541B31D0BAC6B660A07595BC3803CD8EA85DE75F38AFEE9A79D60FCA9BDFD61BD5B505DBACE963C74C338B3DA10F851E3892CDF374CE1AF123551CCE404E7E3E8B79A82B9A08039F615A4FD994F1AE320EB59A4144236A022C0DAD05945F094A409243F5102ECFE5354AC7A3881EB079DEAD1196AFFD026CC50664ECEAD56885507F812A1A67A7D34731B2C21A2423EF7458A8E0280C425CBCEA03EFA0145D5E56564C9758B84F345C19189F8C0605B544AE1A25E583195C4BB969B66B491590F509C9D6D292103E69B4940F66702D711B6D57922228E81116ACA5A2FA163E90B3E5998E62B729DAC6565637C53F8C2D4D81D5F81285A14B9695822BFEC59865D556D357B3FE05487E8661D9B1A20EA990B6E04483082DB1D00AAC41D273378AE929A2688E589E67EAF81299726FD52CFF39CBEAF6294F62BE0FE4D4EC6F7EB3AABBC8AFEDB87248C291CE619C3E8B6B521C8515A8BB1BAC0C0E792852E4EFA78197F8441F66E97B67B778D5FED91719616C09F24B6194A43329D8AD4F40A7E9915D63D0A92A6299D5A74B0FA1537A1E8956D5AE8B4EF52879B2AA8AA24B606D6DFA7441CD0A5326468DFD67AC15E1797C8C97AA5401F8A79E18956A0709ACD2D61DB55E9052C5ACB7744714AA4EAA9042530F29ABB5253521AB0D2BE16934AAA6E8CE41AE26A9A2CBADDD91157525556845F30AD80A99C5B6EEA88AD2932AB0A2B93B765987222EA53BBC8B69CF326B6E63D9A177BD7D4C83F13CEBE230DB60E56EBF0A54F9DC138BDFDE4B60FCFB4EDA94F6E4B7A64D65198FF56C4A83A15F856A77E3F545A8F1425F8F59BBF0AE2DF44D17FE7ABC7E96FBACF6211DFF4492827B710C148E7B637EF46A7F74239DC53212D3C8D50856F51453EC8F18C168F6D59B7A2E664B7A4E708988BBC031CD8A3CCCC3FD8343E1C5CEEEBC9EB1E2D8F1144757DD139AFA9C6DA05E8B3CA0C8BE47915C3DB1C60B9312544A4C5F10073F4ECC3FD35EC7698E83FD957EDE332EE23BE27E4DA0E1364AB0F1975C0D3A4CC57D87371E85A07FBD88C713DD557EF1FBE7ACEB9E711D813B1D1BFB82A25799FEFA938A5ED2645DD79066E587162FD7DB6A2F1794A882B7ACFE5061EED2411E29E4527EE7A3C7EFFB8AA67C88B016A2E2B1C1507883A850F79860152CED4302077ED2F42141BFC1AA1F16AC229AF651814BFA83894F0ABA2F4379CF2DEE438A63D32696A454CFAD25D96BD5676E7B6F922AB7D77274B93ABB07DCA015D8EB85282FACB279B0AD5351B83C18F636EDFED9AB9577A540B90CDAB75B97BCC952E4862BA6FF5505F20ED4CC296A80B65F67BC695BD3E58177BC58B35F35F18E191BDFE6B75F33BC6963D3258877DCD87A5506EF98AD6D6BFFDCB2A575DE42B75EE72B972C69EE735459E4B63ADE2CE50EC7FF790046904594D9F34B75E15853D16B0BC39244CF545FB12632961C47E22B5134B3ED3756BEE1370E96D334B3D5D47936F1E6EB7F236F4ED3CC5B533DB98D0A6465FDA2AA2ABC651D6B2AA87A4915C7B591B414B8B7C5AC8D97F32FA9C07810A5D4BC4773BBFC72EA890751C990AED3A37E58BE2886BDB3F26F38C2FE1DBBCB1282FD8B8E04DBB55DB3A0B9208B20DFBC05897212214373892972604B3D89A8BB4036856696804EDF8FA7493D760D32C7CE05B94E6898501832F6E75E2DE1C5828026FE6991745DE6F175C87EC5430C01C47459E2FE9ABC4F5CCF29E43E57E48434102CBAE0E95E369794A57D974F05D255403A0271F51541D12DF6430FC0E26B32430F7815D9C0FC3EE025B29FCA0CA00EA47D22EA6A1F9FBA6819213FE618657FF80936ECF88FEFFE031800276BCA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'77f574bb-6077-4c02-9e6a-8a6b82900b39', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7146b520-642e-4096-8a7a-d92e6ece04b5', N'77f574bb-6077-4c02-9e6a-8a6b82900b39')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7146b520-642e-4096-8a7a-d92e6ece04b5', N'amandaallen0227@gmail.com', 0, N'AELdlRTgDZPsj8Tb2jTyQC0rdny1La8c3kcJkZzlV4av6k/ssIcsNheCZTa64zKZew==', N'b13c21ab-da12-48b4-bbef-a28d17762bf3', NULL, 0, 0, NULL, 1, 0, N'amandaallen0227@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'88fdff0a-3502-4613-8209-0a757399982b', N'customer@example.com', 0, N'AAUNkdgiER8xIPMuNFVhl2e11ZQhShxSIouAFDz8nSKn7LA4X72c+gymmbGNED+xZg==', N'5d2f69ab-072a-4d5d-bb3d-df5c77f7637a', NULL, 0, 0, NULL, 1, 0, N'customer@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'964ad450-4663-4868-9a24-858e313da9f4', N'admin@example.com', 1, N'ALD71DZQNk0ivKWz+Cohcj9CCpCoK7gFbkHd6SKNkw+zJWC1EDENrvMEUqX/AOvfBg==', N'fff6fc92-08c9-45bf-806a-979d70b487ff', NULL, 0, 0, NULL, 1, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[Coffee] ON 

INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (24, N'Silhouette Blend', 2, 25.9900, N'An expertly crafted, seasonally changing blend of coffees taken to different roast profiles. Stands up to cream and sugar while maintaining a complexity not found in most dark roast coffees.', 1, 5, N'blend-silhouette-blend.jpg', N'Multi', N'Multi')
INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (25, N'Tolima Decaf', 2, 23.9900, N'The Sugar Cane decaffeination process removes the caffeine while allowing the coffee to retain its best qualities; sweetness, body, and acidity. It is the cleanest decaf we''ve ever tasted. ', 1, 3, N'colombia-tolima-decaf.jpg', N'Tolima', N'Colombia')
INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (26, N'Captail Del Mundo Honey', 1, 18.9900, N'Delicate and subtle, yet layered with flavors that increase in complexity as it cools; dried fig, rich caramel, apple sauce, croissant, brown butter, milk chocolate… notably balanced and complete', 1, 4, N'el-salvador-captail-del-mundo-honey.jpg', N'Colomba, Santa Ana', N'El Salvador')
INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (27, N'Demeka Washed', 1, 20.8900, N'Apricot, cane sugar, jasmine tea, bergamot, delicte, and bright - classic flavors of the best washed coffees from Ethiopia', 1, 2, N'ethiopia-demeka-washed.jpg', N'Becha Village, Sidama', N'Ethiopia')
INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (28, N'El Zapote', 3, 23.9900, N'Creamy and balanced. Notes of black current, fig, caramel, and baker''s cocoa, with a pleasant, red apple acidity.', 1, 1, N'guatemala-el-zapote.jpg', N'Acatenango', N'Guatemala')
INSERT [dbo].[Coffee] ([CoffeeID], [CoffeeName], [TypeID], [Price], [Description], [CoffeeStatusID], [SupplierID], [Images], [Country], [Region]) VALUES (30, N'', 1, 18.9900, N' we provide our whole-bean New Orleans–Style Coffee and Ground Chicory, and a recipe to get you started. You just add the milk, sugar, ice, and a little bit of time.', 1, 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Coffee] OFF
SET IDENTITY_INSERT [dbo].[CoffeeStatus] ON 

INSERT [dbo].[CoffeeStatus] ([CoffeeStatusID], [StatusName]) VALUES (1, N'In Stock')
INSERT [dbo].[CoffeeStatus] ([CoffeeStatusID], [StatusName]) VALUES (2, N'Out of Stock')
INSERT [dbo].[CoffeeStatus] ([CoffeeStatusID], [StatusName]) VALUES (3, N'On Back Order')
INSERT [dbo].[CoffeeStatus] ([CoffeeStatusID], [StatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[CoffeeStatus] OFF
SET IDENTITY_INSERT [dbo].[CoffeeSupplier] ON 

INSERT [dbo].[CoffeeSupplier] ([SupplierID], [SupplierName], [Description], [Images], [Region], [Country]) VALUES (1, N'Yukon', N'Creamy and balanced. Notes of black current, fig, caramel, and baker''s cocoa, with a pleasant, red apple acidity.', NULL, N'Acatenango', N'Guatemala')
INSERT [dbo].[CoffeeSupplier] ([SupplierID], [SupplierName], [Description], [Images], [Region], [Country]) VALUES (2, N'Demeka Becha ', N'Apricot, cane sugar, jasmine tea, bergamot, delicte, and bright - classic flavors of the best washed coffees from Ethiopia', NULL, N'Becha Village, Sidama', N'Ethiopia')
INSERT [dbo].[CoffeeSupplier] ([SupplierID], [SupplierName], [Description], [Images], [Region], [Country]) VALUES (3, N'Masli', N'The Sugar Cane decaffeination process removes the caffeine while allowing the coffee to retain its best qualities; sweetness, body, and acidity. It is the cleanest decaf we''ve ever tasted.', NULL, N'Tolima', N'Colombia')
INSERT [dbo].[CoffeeSupplier] ([SupplierID], [SupplierName], [Description], [Images], [Region], [Country]) VALUES (4, N'Finca Colomba', N'Delicate and subtle, yet layered with flavors that increase in complexity as it cools; dried fig, rich caramel, apple sauce, croissant, brown butter, milk chocolate… notably balanced and complete', NULL, N'Colomba, Santa Ana', N'El Salvador')
INSERT [dbo].[CoffeeSupplier] ([SupplierID], [SupplierName], [Description], [Images], [Region], [Country]) VALUES (5, N'Messenger', N'An expertly crafted, seasonally changing blend of coffees taken to different roast profiles. Stands up to cream and sugar while maintaining a complexity not found in most dark roast coffees.', NULL, N'Multi', N'Multi')
SET IDENTITY_INSERT [dbo].[CoffeeSupplier] OFF
SET IDENTITY_INSERT [dbo].[CoffeeType] ON 

INSERT [dbo].[CoffeeType] ([TypeID], [Name]) VALUES (1, N'Drip')
INSERT [dbo].[CoffeeType] ([TypeID], [Name]) VALUES (2, N'Espresso')
INSERT [dbo].[CoffeeType] ([TypeID], [Name]) VALUES (3, N'Cold Brew')
SET IDENTITY_INSERT [dbo].[CoffeeType] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (1, N'Mitch ', N'Hatton', 1, N'1235 linden lane', N'Kansas City', N'MO', N'64111', N'816-874-1256', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (2, N'Andrew', N'Best', 1, N'3295 oak st', N'Topeka', N'KS', N'68974', N'913-264-8105', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (3, N'Abram', N'White', 0, N'6795 47th st', N'Pheonix', N'AZ', N'56854', N'602-786-1695', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (4, N'Monica', N'Baker', 0, N'432 broadway', N'Denver', N'CO', N'12574', N'720-751-8352', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (5, N'John', N'Cheadle', 1, N'4895 granite lane', N'Tampa', N'FL', N'36945', N'813-204-6318', NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstN], [LastN], [IsMember], [Address], [City], [State], [PostalCode], [Phone], [Email]) VALUES (6, N'Rebecca', N'Grasher', 0, N'7689 luna ave', N'Lee''s Summit', N'MO', N'64820', N'816-155-3520', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstN], [LastN], [TitleID], [BirthDate], [HireDate], [Address], [City], [State], [PostalCode], [Images], [Phone]) VALUES (1, N'T', N'Jensen', 1, N'08/31/1975', N'N/A', N'48953 sw 11th street', N'Lee''s Summit', N'MO', N'64082', NULL, N'816-627-7845')
INSERT [dbo].[Employee] ([EmployeeID], [FirstN], [LastN], [TitleID], [BirthDate], [HireDate], [Address], [City], [State], [PostalCode], [Images], [Phone]) VALUES (3, N'Elise', N'Patterson', 2, N'04/18/1990', N'02/07/2018', N'1875 Linden Lane', N'Lenexa', N'KS', N'68794', NULL, N'913-789-8724')
INSERT [dbo].[Employee] ([EmployeeID], [FirstN], [LastN], [TitleID], [BirthDate], [HireDate], [Address], [City], [State], [PostalCode], [Images], [Phone]) VALUES (4, N'Myles', N'Best', 3, N'09/14/1995', N'05/25/2019', N'4728 Granite Lane', N'Blue Springs', N'MO', N'78698', NULL, N'816-325-8296')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeTitle] ON 

INSERT [dbo].[EmployeeTitle] ([TitleID], [TitleName]) VALUES (1, N'Owner')
INSERT [dbo].[EmployeeTitle] ([TitleID], [TitleName]) VALUES (2, N'Manager')
INSERT [dbo].[EmployeeTitle] ([TitleID], [TitleName]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[EmployeeTitle] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'7146b520-642e-4096-8a7a-d92e6ece04b5', N'Amanda', N'Allen', N'#fff')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee]  WITH CHECK ADD  CONSTRAINT [FK_Coffee_CoffeeStatus] FOREIGN KEY([CoffeeStatusID])
REFERENCES [dbo].[CoffeeStatus] ([CoffeeStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee] CHECK CONSTRAINT [FK_Coffee_CoffeeStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeSupplier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee]  WITH CHECK ADD  CONSTRAINT [FK_Coffee_CoffeeSupplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[CoffeeSupplier] ([SupplierID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeSupplier]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee] CHECK CONSTRAINT [FK_Coffee_CoffeeSupplier]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee]  WITH CHECK ADD  CONSTRAINT [FK_Coffee_CoffeeType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[CoffeeType] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coffee_CoffeeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coffee]'))
ALTER TABLE [dbo].[Coffee] CHECK CONSTRAINT [FK_Coffee_CoffeeType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_EmployeeTitle1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeTitle1] FOREIGN KEY([TitleID])
REFERENCES [dbo].[EmployeeTitle] ([TitleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_EmployeeTitle1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeTitle1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
