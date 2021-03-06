/****** Object:  Table [dbo].[Pelanggan]    Script Date: 03/12/2021 07:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelanggan](
	[PelangganID] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](100) NULL,
	[Alamat] [varchar](max) NULL,
	[NoTelp] [varchar](20) NULL,
 CONSTRAINT [PK_Pelanggan] PRIMARY KEY CLUSTERED 
(
	[PelangganID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produk]    Script Date: 03/12/2021 07:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produk](
	[ProdukID] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](100) NULL,
	[Harga] [int] NULL,
	[Deskripsi] [varchar](max) NULL,
 CONSTRAINT [PK_Produk] PRIMARY KEY CLUSTERED 
(
	[ProdukID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 03/12/2021 07:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[TransaksiID] [int] IDENTITY(1,1) NOT NULL,
	[KodeTransaksi] [varchar](50) NULL,
	[Tanggal] [date] NULL,
	[PelangganID] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pelanggan] ON 

INSERT [dbo].[Pelanggan] ([PelangganID], [Nama], [Alamat], [NoTelp]) VALUES (1, N'Indra', N'Gang Baru, Kota Tangerang', N'08123456789')
INSERT [dbo].[Pelanggan] ([PelangganID], [Nama], [Alamat], [NoTelp]) VALUES (2, N'Angga', N'Jl. Rawa baru, Kota Jakarta', N'08127634567')
INSERT [dbo].[Pelanggan] ([PelangganID], [Nama], [Alamat], [NoTelp]) VALUES (3, N'Manda', N'Jl. Sutera Barat, Kota Tangerang', N'08129876543')
SET IDENTITY_INSERT [dbo].[Pelanggan] OFF
SET IDENTITY_INSERT [dbo].[Produk] ON 

INSERT [dbo].[Produk] ([ProdukID], [Nama], [Harga], [Deskripsi]) VALUES (1, N'HDD Eksternal 1TB', 2000000, N'Barang Baru Beneran')
INSERT [dbo].[Produk] ([ProdukID], [Nama], [Harga], [Deskripsi]) VALUES (2, N'Memory 4 GB', 100000, NULL)
INSERT [dbo].[Produk] ([ProdukID], [Nama], [Harga], [Deskripsi]) VALUES (3, N'Mouse', 150000, NULL)
SET IDENTITY_INSERT [dbo].[Produk] OFF
SET IDENTITY_INSERT [dbo].[Transaksi] ON 

INSERT [dbo].[Transaksi] ([TransaksiID], [KodeTransaksi], [Tanggal], [PelangganID], [Total]) VALUES (1, N'TR0001/0907/19', CAST(N'2019-07-09' AS Date), 3, 2700000)
INSERT [dbo].[Transaksi] ([TransaksiID], [KodeTransaksi], [Tanggal], [PelangganID], [Total]) VALUES (2, N'TR0002/0907/19', CAST(N'2019-07-09' AS Date), 2, 1000000)
INSERT [dbo].[Transaksi] ([TransaksiID], [KodeTransaksi], [Tanggal], [PelangganID], [Total]) VALUES (3, N'TR0003/0907/19', CAST(N'2019-07-09' AS Date), 3, 165000)
SET IDENTITY_INSERT [dbo].[Transaksi] OFF
USE [master]
GO
ALTER DATABASE [TesWeb] SET  READ_WRITE 
GO
