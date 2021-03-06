USE [master]
GO
/****** Object:  Database [db_penjualan]    Script Date: 4/10/2021 6:17:46 AM ******/
CREATE DATABASE [db_penjualan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_penjualan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_penjualan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_penjualan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_penjualan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_penjualan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_penjualan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_penjualan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_penjualan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_penjualan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_penjualan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_penjualan] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_penjualan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_penjualan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_penjualan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_penjualan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_penjualan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_penjualan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_penjualan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_penjualan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_penjualan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_penjualan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_penjualan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_penjualan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_penjualan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_penjualan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_penjualan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_penjualan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_penjualan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_penjualan] SET RECOVERY FULL 
GO
ALTER DATABASE [db_penjualan] SET  MULTI_USER 
GO
ALTER DATABASE [db_penjualan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_penjualan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_penjualan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_penjualan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_penjualan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_penjualan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_penjualan', N'ON'
GO
ALTER DATABASE [db_penjualan] SET QUERY_STORE = OFF
GO
USE [db_penjualan]
GO
/****** Object:  Table [dbo].[tabel_barang]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabel_barang](
	[KodeBuku] [char](4) NOT NULL,
	[NamaBuku] [varchar](50) NOT NULL,
	[Harga] [int] NOT NULL,
	[Stok] [int] NOT NULL,
 CONSTRAINT [PK_tabel_barang] PRIMARY KEY CLUSTERED 
(
	[KodeBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabel_detailpenjualan]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabel_detailpenjualan](
	[NoKwitansi] [varchar](20) NOT NULL,
	[KodeBuku] [char](4) NOT NULL,
	[Jumlah] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_detail]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_detail]
AS
SELECT dbo.tabel_detailpenjualan.NoKwitansi, dbo.tabel_detailpenjualan.KodeBuku, dbo.tabel_barang.NamaBuku, dbo.tabel_barang.Harga, dbo.tabel_detailpenjualan.Jumlah
FROM   dbo.tabel_barang INNER JOIN
             dbo.tabel_detailpenjualan ON dbo.tabel_barang.KodeBuku = dbo.tabel_detailpenjualan.KodeBuku
GO
/****** Object:  Table [dbo].[tabel_pelanggan]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabel_pelanggan](
	[IdPelanggan] [char](4) NOT NULL,
	[NamaPelanggan] [varchar](50) NOT NULL,
	[Alamat] [varchar](100) NULL,
	[NoHp] [varchar](13) NULL,
 CONSTRAINT [PK_tabel_pelanggan] PRIMARY KEY CLUSTERED 
(
	[IdPelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabel_penjualan]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabel_penjualan](
	[NoKwitansi] [varchar](20) NOT NULL,
	[TglKwitansi] [date] NOT NULL,
	[IdPelanggan] [char](4) NOT NULL,
 CONSTRAINT [PK_tabel_penjualan] PRIMARY KEY CLUSTERED 
(
	[NoKwitansi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_penjualan]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_penjualan]
AS
SELECT dbo.tabel_penjualan.NoKwitansi, dbo.tabel_penjualan.TglKwitansi, dbo.tabel_penjualan.IdPelanggan, dbo.tabel_pelanggan.NamaPelanggan
FROM   dbo.tabel_penjualan INNER JOIN
             dbo.tabel_pelanggan ON dbo.tabel_penjualan.IdPelanggan = dbo.tabel_pelanggan.IdPelanggan
GO
/****** Object:  View [dbo].[vw_cetaktransaksi]    Script Date: 4/10/2021 6:17:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_cetaktransaksi]
AS
SELECT dbo.tabel_detailpenjualan.NoKwitansi, dbo.tabel_penjualan.TglKwitansi, dbo.tabel_penjualan.IdPelanggan, dbo.tabel_pelanggan.NamaPelanggan, dbo.tabel_detailpenjualan.KodeBuku, dbo.tabel_barang.NamaBuku, dbo.tabel_barang.Harga, dbo.tabel_detailpenjualan.Jumlah, 
             dbo.tabel_barang.Harga * dbo.tabel_detailpenjualan.Jumlah AS JumlahBayar
FROM   dbo.tabel_barang INNER JOIN
             dbo.tabel_detailpenjualan ON dbo.tabel_barang.KodeBuku = dbo.tabel_detailpenjualan.KodeBuku INNER JOIN
             dbo.tabel_penjualan ON dbo.tabel_detailpenjualan.NoKwitansi = dbo.tabel_penjualan.NoKwitansi INNER JOIN
             dbo.tabel_pelanggan ON dbo.tabel_penjualan.IdPelanggan = dbo.tabel_pelanggan.IdPelanggan
GO
ALTER TABLE [dbo].[tabel_detailpenjualan]  WITH CHECK ADD  CONSTRAINT [relasi_penjualan] FOREIGN KEY([NoKwitansi])
REFERENCES [dbo].[tabel_penjualan] ([NoKwitansi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tabel_detailpenjualan] CHECK CONSTRAINT [relasi_penjualan]
GO
ALTER TABLE [dbo].[tabel_detailpenjualan]  WITH CHECK ADD  CONSTRAINT [relasi_penjualan_barang] FOREIGN KEY([KodeBuku])
REFERENCES [dbo].[tabel_barang] ([KodeBuku])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tabel_detailpenjualan] CHECK CONSTRAINT [relasi_penjualan_barang]
GO
ALTER TABLE [dbo].[tabel_penjualan]  WITH CHECK ADD  CONSTRAINT [Relasi_Penjualan_Pelanggan] FOREIGN KEY([IdPelanggan])
REFERENCES [dbo].[tabel_pelanggan] ([IdPelanggan])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tabel_penjualan] CHECK CONSTRAINT [Relasi_Penjualan_Pelanggan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -144
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tabel_barang"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tabel_detailpenjualan"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 179
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tabel_pelanggan"
            Begin Extent = 
               Top = 180
               Left = 336
               Bottom = 377
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tabel_penjualan"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 377
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_cetaktransaksi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_cetaktransaksi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tabel_barang"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tabel_detailpenjualan"
            Begin Extent = 
               Top = 36
               Left = 406
               Bottom = 206
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tabel_penjualan"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 179
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tabel_pelanggan"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_penjualan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_penjualan'
GO
USE [master]
GO
ALTER DATABASE [db_penjualan] SET  READ_WRITE 
GO
