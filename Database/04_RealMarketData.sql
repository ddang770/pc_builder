USE PCBuilderDB;
GO

/* ==================================================================================
   04_RealMarketData.sql
   Bộ linh kiện máy tính thực tế thị trường Việt Nam (10 triệu - 100 triệu VND)
   Tích hợp đầy đủ thông số kỹ thuật (Socket, RAM, TDP, Kích thước, Công suất, Benchmark)
   ================================================================================== */

-- 1. Bổ sung các hãng sản xuất (Brands) nếu chưa có
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'DeepCool') INSERT dbo.Brands(BrandName) VALUES (N'DeepCool');
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'Thermalright') INSERT dbo.Brands(BrandName) VALUES (N'Thermalright');
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'NZXT') INSERT dbo.Brands(BrandName) VALUES (N'NZXT');
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'Lian Li') INSERT dbo.Brands(BrandName) VALUES (N'Lian Li');
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'G.Skill') INSERT dbo.Brands(BrandName) VALUES (N'G.Skill');
IF NOT EXISTS (SELECT 1 FROM dbo.Brands WHERE BrandName = N'Xigmatek') INSERT dbo.Brands(BrandName) VALUES (N'Xigmatek');
GO

-- Lấy ID danh mục
DECLARE @CPU INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'CPU');
DECLARE @MB INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'MOTHERBOARD');
DECLARE @RAM INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'RAM');
DECLARE @GPU INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'GPU');
DECLARE @PSU INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'PSU');
DECLARE @SSD INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'STORAGE');
DECLARE @CASE INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'CASE');
DECLARE @COOL INT = (SELECT CategoryID FROM dbo.Categories WHERE CategoryCode = 'COOLING');

-- Lấy ID các hãng
DECLARE @Intel INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Intel');
DECLARE @AMD INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'AMD');
DECLARE @Nvidia INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'NVIDIA');
DECLARE @Asus INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'ASUS');
DECLARE @MSI INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'MSI');
DECLARE @Giga INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Gigabyte');
DECLARE @Corsair INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Corsair');
DECLARE @Kingston INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Kingston');
DECLARE @Samsung INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Samsung');
DECLARE @WD INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Western Digital');
DECLARE @Seasonic INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Seasonic');
DECLARE @CM INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Cooler Master');
DECLARE @DeepCool INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'DeepCool');
DECLARE @Thermalright INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Thermalright');
DECLARE @NZXT INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'NZXT');
DECLARE @LianLi INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Lian Li');
DECLARE @GSkill INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'G.Skill');
DECLARE @Xigmatek INT = (SELECT BrandID FROM dbo.Brands WHERE BrandName = N'Xigmatek');

/* ==================================================================================
   A. THÊM LINH KIỆN VÀO BẢNG dbo.Components
   ================================================================================== */

-- 1. CPU
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I3-12100F')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i3-12100F', 'CPU-INTEL-I3-12100F', 1890000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-AMD-R5-5600')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @AMD, N'Ryzen 5 5600', 'CPU-AMD-R5-5600', 2690000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I5-13400F')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i5-13400F', 'CPU-INTEL-I5-13400F', 4690000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I5-14600K')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i5-14600K', 'CPU-INTEL-I5-14600K', 7590000, 12);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-AMD-R7-7700X')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @AMD, N'Ryzen 7 7700X', 'CPU-AMD-R7-7700X', 7990000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I7-14700K')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i7-14700K', 'CPU-INTEL-I7-14700K', 10890000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-AMD-R7-7800X3D')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @AMD, N'Ryzen 7 7800X3D', 'CPU-AMD-R7-7800X3D', 11290000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I9-14900K')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i9-14900K', 'CPU-INTEL-I9-14900K', 14790000, 8);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-AMD-R9-7950X3D')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @AMD, N'Ryzen 9 7950X3D', 'CPU-AMD-R9-7950X3D', 15990000, 6);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CPU-INTEL-I9-14900KS')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CPU, @Intel, N'Core i9-14900KS', 'CPU-INTEL-I9-14900KS', 17490000, 5);

-- 2. MOTHERBOARDS
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-ASUS-H610M-K-D4')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Asus, N'PRIME H610M-K D4', 'MB-ASUS-H610M-K-D4', 1650000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-MSI-B550M-PRO')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @MSI, N'B550M PRO-VDH WIFI', 'MB-MSI-B550M-PRO', 2190000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-ASUS-TUF-B760M-D4')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Asus, N'TUF GAMING B760M-PLUS D4', 'MB-ASUS-TUF-B760M-D4', 3390000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-MSI-B760-PLUS-D5')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @MSI, N'B760 GAMING PLUS WIFI DDR5', 'MB-MSI-B760-PLUS-D5', 3890000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-GIGA-B650M-PLUS')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Giga, N'B650M GAMING PLUS WIFI', 'MB-GIGA-B650M-PLUS', 3590000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-MSI-B650-TOMAHAWK')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @MSI, N'MAG B650 TOMAHAWK WIFI', 'MB-MSI-B650-TOMAHAWK', 5290000, 12);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-GIGA-Z790-ELITE')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Giga, N'Z790 AORUS ELITE AX', 'MB-GIGA-Z790-ELITE', 6890000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-ASUS-ROG-X670E-F')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Asus, N'ROG STRIX X670E-F GAMING WIFI', 'MB-ASUS-ROG-X670E-F', 10990000, 8);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'MB-ASUS-MAXIMUS-Z790')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@MB, @Asus, N'ROG MAXIMUS Z790 DARK HERO', 'MB-ASUS-MAXIMUS-Z790', 17990000, 5);

-- 3. RAM
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-KINGSTON-D4-16GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @Kingston, N'Fury Beast 16GB (2x8GB) DDR4 3200MHz', 'RAM-KINGSTON-D4-16GB', 890000, 40);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-CORSAIR-D4-32GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @Corsair, N'Vengeance LPX 32GB (2x16GB) DDR4 3200MHz', 'RAM-CORSAIR-D4-32GB', 1690000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-CORSAIR-D5-32GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @Corsair, N'Vengeance RGB 32GB (2x16GB) DDR5 6000MHz', 'RAM-CORSAIR-D5-32GB', 2790000, 30);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-GSKILL-D5-32GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @GSkill, N'Trident Z5 RGB 32GB (2x16GB) DDR5 6400MHz', 'RAM-GSKILL-D5-32GB', 3490000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-GSKILL-D5-64GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @GSkill, N'Trident Z5 RGB 64GB (2x32GB) DDR5 6400MHz', 'RAM-GSKILL-D5-64GB', 6490000, 12);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'RAM-CORSAIR-D5-64GB-DOM')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@RAM, @Corsair, N'Dominator Titanium 64GB (2x32GB) DDR5 6600MHz', 'RAM-CORSAIR-D5-64GB-DOM', 7490000, 10);

-- 4. GPU
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-MSI-GTX1650')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @MSI, N'GeForce GTX 1650 D6 VENTUS XS 4GB', 'GPU-MSI-GTX1650', 3490000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-ASUS-RTX3050-6G')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Asus, N'Dual GeForce RTX 3050 V2 OC 6GB', 'GPU-ASUS-RTX3050-6G', 4590000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-MSI-RX6600')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @MSI, N'Radeon RX 6600 MECH 2X 8GB', 'GPU-MSI-RX6600', 5490000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-GIGA-RTX4060')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Giga, N'GeForce RTX 4060 WINDFORCE OC 8GB', 'GPU-GIGA-RTX4060', 7890000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-ASUS-RTX4060TI')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Asus, N'Dual GeForce RTX 4060 Ti EVO OC 8GB', 'GPU-ASUS-RTX4060TI', 10790000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-GIGA-RTX4070S')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Giga, N'GeForce RTX 4070 SUPER EAGLE OC 12GB', 'GPU-GIGA-RTX4070S', 16990000, 12);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-MSI-RTX4070TIS')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @MSI, N'GeForce RTX 4070 Ti SUPER GAMING X SLIM 16GB', 'GPU-MSI-RTX4070TIS', 22990000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-ASUS-RTX4080S')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Asus, N'TUF Gaming GeForce RTX 4080 SUPER 16GB', 'GPU-ASUS-RTX4080S', 29490000, 8);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-GIGA-RTX4090')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Giga, N'GeForce RTX 4090 GAMING OC 24GB', 'GPU-GIGA-RTX4090', 49990000, 5);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'GPU-ASUS-ROG-RTX4090')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@GPU, @Asus, N'ROG Strix GeForce RTX 4090 OC 24GB', 'GPU-ASUS-ROG-RTX4090', 57990000, 4);

-- 5. PSU
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-CM-500W')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @CM, N'Elite V3 500W', 'PSU-CM-500W', 790000, 30);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-DEEPCOOL-550W')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @DeepCool, N'PK550D 550W 80 Plus Bronze', 'PSU-DEEPCOOL-550W', 1050000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-MSI-650W')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @MSI, N'MAG A650BN 650W 80 Plus Bronze', 'PSU-MSI-650W', 1350000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-CORSAIR-750W')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @Corsair, N'CX750 750W 80 Plus Bronze', 'PSU-CORSAIR-750W', 1750000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-SEASONIC-GX750')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @Seasonic, N'Focus GX-750 750W 80 Plus Gold', 'PSU-SEASONIC-GX750', 2790000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-CORSAIR-RM850E')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @Corsair, N'RM850e ATX 3.0 850W 80 Plus Gold', 'PSU-CORSAIR-RM850E', 3290000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-SEASONIC-GX1000')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @Seasonic, N'Focus GX-1000 ATX 3.0 1000W 80 Plus Gold', 'PSU-SEASONIC-GX1000', 4890000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'PSU-ASUS-THOR-1200W')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@PSU, @Asus, N'ROG THOR 1200W Platinum II', 'PSU-ASUS-THOR-1200W', 8990000, 5);

-- 6. STORAGE
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'SSD-KINGSTON-500GB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@SSD, @Kingston, N'NV2 500GB PCIe 4.0 NVMe', 'SSD-KINGSTON-500GB', 950000, 35);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'SSD-WD-SN770-1TB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@SSD, @WD, N'Black SN770 1TB PCIe 4.0 NVMe', 'SSD-WD-SN770-1TB', 1890000, 30);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'SSD-SAMSUNG-980PRO-1TB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@SSD, @Samsung, N'980 PRO 1TB PCIe 4.0 NVMe', 'SSD-SAMSUNG-980PRO-1TB', 2590000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'SSD-SAMSUNG-990PRO-2TB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@SSD, @Samsung, N'990 PRO 2TB PCIe 4.0 NVMe', 'SSD-SAMSUNG-990PRO-2TB', 4690000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'SSD-SAMSUNG-990PRO-4TB')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@SSD, @Samsung, N'990 PRO 4TB PCIe 4.0 NVMe', 'SSD-SAMSUNG-990PRO-4TB', 9290000, 8);

-- 7. CASE
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-NYX-AIR')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @Xigmatek, N'NYX Air 3F (M-ATX)', 'CASE-NYX-AIR', 650000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-MSI-FORGE-120A')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @MSI, N'MAG FORGE 120A AIRFLOW (ATX)', 'CASE-MSI-FORGE-120A', 1190000, 20);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-CORSAIR-4000D')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @Corsair, N'4000D AIRFLOW Tempered Glass', 'CASE-CORSAIR-4000D', 2190000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-NZXT-H5-FLOW')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @NZXT, N'H5 Flow RGB Black', 'CASE-NZXT-H5-FLOW', 2590000, 12);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-LIANLI-O11D-EVO')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @LianLi, N'O11 Dynamic EVO Black', 'CASE-LIANLI-O11D-EVO', 3990000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'CASE-ASUS-ROG-HYPERION')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@CASE, @Asus, N'ROG Hyperion GR701 Flagship Case', 'CASE-ASUS-ROG-HYPERION', 9890000, 4);

-- 8. COOLING
IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'COOL-DEEPCOOL-AG400')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@COOL, @DeepCool, N'AG400 ARGB Single Tower', 'COOL-DEEPCOOL-AG400', 490000, 30);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'COOL-THERMALRIGHT-PA120')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@COOL, @Thermalright, N'Peerless Assassin 120 SE ARGB', 'COOL-THERMALRIGHT-PA120', 850000, 25);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'COOL-DEEPCOOL-LT520')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@COOL, @DeepCool, N'LT520 240mm AIO Liquid Cooler', 'COOL-DEEPCOOL-LT520', 2190000, 15);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'COOL-CORSAIR-H150I')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@COOL, @Corsair, N'iCUE H150i RGB ELITE 360mm AIO', 'COOL-CORSAIR-H150I', 4390000, 10);

IF NOT EXISTS (SELECT 1 FROM dbo.Components WHERE SKU = 'COOL-ASUS-RYUJIN3')
    INSERT dbo.Components(CategoryID, BrandID, ModelName, SKU, Price, StockQuantity) VALUES (@COOL, @Asus, N'ROG RYUJIN III 360 ARGB with LCD', 'COOL-ASUS-RYUJIN3', 8490000, 5);
GO

/* ==================================================================================
   B. CẬP NHẬT THÔNG SỐ KỸ THUẬT CHO TỪNG BẢNG SPECS
   ================================================================================== */

-- 1. CPU_Specs
INSERT dbo.CPU_Specs(ComponentID, Socket, CoreCount, ThreadCount, BaseClockGHz, BoostClockGHz, TDP_W, IntegratedGPU, MemoryType)
SELECT c.ComponentID, v.Socket, v.CoreCount, v.ThreadCount, v.BaseClock, v.BoostClock, v.TDP, v.iGPU, v.MemoryType
FROM dbo.Components c
JOIN (VALUES
    ('CPU-INTEL-I3-12100F', N'LGA1700', 4, 8, 3.3, 4.3, 58, 0, 'DDR4'),
    ('CPU-AMD-R5-5600', N'AM4', 6, 12, 3.5, 4.4, 65, 0, 'DDR4'),
    ('CPU-INTEL-I5-13400F', N'LGA1700', 10, 16, 2.5, 4.6, 65, 0, 'DDR5'),
    ('CPU-INTEL-I5-14600K', N'LGA1700', 14, 20, 3.5, 5.3, 125, 1, 'DDR5'),
    ('CPU-AMD-R7-7700X', N'AM5', 8, 16, 4.5, 5.4, 105, 1, 'DDR5'),
    ('CPU-INTEL-I7-14700K', N'LGA1700', 20, 28, 3.4, 5.6, 125, 1, 'DDR5'),
    ('CPU-AMD-R7-7800X3D', N'AM5', 8, 16, 4.2, 5.0, 120, 1, 'DDR5'),
    ('CPU-INTEL-I9-14900K', N'LGA1700', 24, 32, 3.2, 6.0, 125, 1, 'DDR5'),
    ('CPU-AMD-R9-7950X3D', N'AM5', 16, 32, 4.2, 5.7, 120, 1, 'DDR5'),
    ('CPU-INTEL-I9-14900KS', N'LGA1700', 24, 32, 3.2, 6.2, 150, 1, 'DDR5')
) v(SKU, Socket, CoreCount, ThreadCount, BaseClock, BoostClock, TDP, iGPU, MemoryType) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.CPU_Specs s WHERE s.ComponentID = c.ComponentID);

-- 2. Motherboard_Specs
INSERT dbo.Motherboard_Specs(ComponentID, Socket, Chipset, FormFactor, MemoryType, MemorySlots, MaxMemoryGB, MaxMemorySpeedMHz, M2Slots, SATAConnections)
SELECT c.ComponentID, v.Socket, v.Chipset, v.FormFactor, v.MemoryType, v.Slots, v.MaxGB, v.Speed, v.M2, v.SATA
FROM dbo.Components c
JOIN (VALUES
    ('MB-ASUS-H610M-K-D4', N'LGA1700', N'H610', 'Micro-ATX', 'DDR4', 2, 64, 3200, 1, 4),
    ('MB-MSI-B550M-PRO', N'AM4', N'B550', 'Micro-ATX', 'DDR4', 4, 128, 4400, 2, 4),
    ('MB-ASUS-TUF-B760M-D4', N'LGA1700', N'B760', 'Micro-ATX', 'DDR4', 4, 128, 5333, 2, 4),
    ('MB-MSI-B760-PLUS-D5', N'LGA1700', N'B760', 'ATX', 'DDR5', 4, 192, 6800, 2, 4),
    ('MB-GIGA-B650M-PLUS', N'AM5', N'B650', 'Micro-ATX', 'DDR5', 4, 192, 6400, 2, 4),
    ('MB-MSI-B650-TOMAHAWK', N'AM5', N'B650', 'ATX', 'DDR5', 4, 192, 6600, 3, 6),
    ('MB-GIGA-Z790-ELITE', N'LGA1700', N'Z790', 'ATX', 'DDR5', 4, 192, 7600, 4, 6),
    ('MB-ASUS-ROG-X670E-F', N'AM5', N'X670E', 'ATX', 'DDR5', 4, 192, 8000, 4, 4),
    ('MB-ASUS-MAXIMUS-Z790', N'LGA1700', N'Z790', 'ATX', 'DDR5', 4, 192, 8000, 5, 4)
) v(SKU, Socket, Chipset, FormFactor, MemoryType, Slots, MaxGB, Speed, M2, SATA) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.Motherboard_Specs s WHERE s.ComponentID = c.ComponentID);

-- 3. RAM_Specs
INSERT dbo.RAM_Specs(ComponentID, MemoryType, CapacityGB, SpeedMHz, ModuleCount, CASLatency, FormFactor)
SELECT c.ComponentID, v.MemoryType, v.Capacity, v.Speed, v.Modules, v.CAS, 'DIMM'
FROM dbo.Components c
JOIN (VALUES
    ('RAM-KINGSTON-D4-16GB', 'DDR4', 16, 3200, 2, 16),
    ('RAM-CORSAIR-D4-32GB', 'DDR4', 32, 3200, 2, 16),
    ('RAM-CORSAIR-D5-32GB', 'DDR5', 32, 6000, 2, 30),
    ('RAM-GSKILL-D5-32GB', 'DDR5', 32, 6400, 2, 32),
    ('RAM-GSKILL-D5-64GB', 'DDR5', 64, 6400, 2, 32),
    ('RAM-CORSAIR-D5-64GB-DOM', 'DDR5', 64, 6600, 2, 32)
) v(SKU, MemoryType, Capacity, Speed, Modules, CAS) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.RAM_Specs s WHERE s.ComponentID = c.ComponentID);

-- 4. GPU_Specs
INSERT dbo.GPU_Specs(ComponentID, Chipset, VRAM_GB, LengthMM, SlotWidth, RecommendedPSU_W, PowerDraw_W, PowerConnector)
SELECT c.ComponentID, v.Chipset, v.VRAM, v.Length, 2.5, v.RecPSU, v.PowerDraw, v.Connector
FROM dbo.Components c
JOIN (VALUES
    ('GPU-MSI-GTX1650', N'GTX 1650', 4, 178, 350, 75, N'Không cần nguồn phụ'),
    ('GPU-ASUS-RTX3050-6G', N'RTX 3050', 6, 201, 450, 70, N'Không cần nguồn phụ'),
    ('GPU-MSI-RX6600', N'RX 6600', 8, 235, 500, 132, N'1x8-pin'),
    ('GPU-GIGA-RTX4060', N'RTX 4060', 8, 192, 450, 115, N'1x8-pin'),
    ('GPU-ASUS-RTX4060TI', N'RTX 4060 Ti', 8, 227, 550, 160, N'1x8-pin'),
    ('GPU-GIGA-RTX4070S', N'RTX 4070 Super', 12, 261, 650, 220, N'1x16-pin 12VHPWR'),
    ('GPU-MSI-RTX4070TIS', N'RTX 4070 Ti Super', 16, 307, 700, 285, N'1x16-pin 12VHPWR'),
    ('GPU-ASUS-RTX4080S', N'RTX 4080 Super', 16, 348, 750, 320, N'1x16-pin 12VHPWR'),
    ('GPU-GIGA-RTX4090', N'RTX 4090', 24, 340, 1000, 450, N'1x16-pin 12VHPWR'),
    ('GPU-ASUS-ROG-RTX4090', N'RTX 4090 OC', 24, 357, 1000, 500, N'1x16-pin 12VHPWR')
) v(SKU, Chipset, VRAM, Length, RecPSU, PowerDraw, Connector) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.GPU_Specs s WHERE s.ComponentID = c.ComponentID);

-- 5. PSU_Specs
INSERT dbo.PSU_Specs(ComponentID, Wattage_W, EfficiencyRating, FormFactor, ModularType)
SELECT c.ComponentID, v.Wattage, v.Efficiency, 'ATX', v.Modular
FROM dbo.Components c
JOIN (VALUES
    ('PSU-CM-500W', 500, '80+ White', 'Non-Modular'),
    ('PSU-DEEPCOOL-550W', 550, '80+ Bronze', 'Non-Modular'),
    ('PSU-MSI-650W', 650, '80+ Bronze', 'Non-Modular'),
    ('PSU-CORSAIR-750W', 750, '80+ Bronze', 'Non-Modular'),
    ('PSU-SEASONIC-GX750', 750, '80+ Gold', 'Fully-Modular'),
    ('PSU-CORSAIR-RM850E', 850, '80+ Gold', 'Fully-Modular'),
    ('PSU-SEASONIC-GX1000', 1000, '80+ Gold', 'Fully-Modular'),
    ('PSU-ASUS-THOR-1200W', 1200, '80+ Platinum', 'Fully-Modular')
) v(SKU, Wattage, Efficiency, Modular) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.PSU_Specs s WHERE s.ComponentID = c.ComponentID);

-- 6. Storage_Specs
INSERT dbo.Storage_Specs(ComponentID, StorageType, CapacityGB, Interface, FormFactor, ReadSpeedMBps, WriteSpeedMBps)
SELECT c.ComponentID, 'NVMe SSD', v.Capacity, 'PCIe 4.0', 'M.2 2280', v.ReadSpeed, v.WriteSpeed
FROM dbo.Components c
JOIN (VALUES
    ('SSD-KINGSTON-500GB', 500, 3500, 2100),
    ('SSD-WD-SN770-1TB', 1000, 5150, 4900),
    ('SSD-SAMSUNG-980PRO-1TB', 1000, 7000, 5000),
    ('SSD-SAMSUNG-990PRO-2TB', 2000, 7450, 6900),
    ('SSD-SAMSUNG-990PRO-4TB', 4000, 7450, 6900)
) v(SKU, Capacity, ReadSpeed, WriteSpeed) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.Storage_Specs s WHERE s.ComponentID = c.ComponentID);

-- 7. Case_Specs
INSERT dbo.Case_Specs(ComponentID, SupportedFormFactors, MaxGPULengthMM, MaxCoolerHeightMM, MaxPSULengthMM, RadiatorSupport)
SELECT c.ComponentID, v.Supported, v.MaxGPU, v.MaxCooler, 200, v.Radiator
FROM dbo.Components c
JOIN (VALUES
    ('CASE-NYX-AIR', N'Micro-ATX,Mini-ITX', 320, 160, N'240mm'),
    ('CASE-MSI-FORGE-120A', N'ATX,Micro-ATX,Mini-ITX', 330, 160, N'240mm,120mm'),
    ('CASE-CORSAIR-4000D', N'ATX,Micro-ATX,Mini-ITX', 360, 170, N'360mm,280mm,240mm'),
    ('CASE-NZXT-H5-FLOW', N'ATX,Micro-ATX,Mini-ITX', 365, 165, N'280mm,240mm'),
    ('CASE-LIANLI-O11D-EVO', N'E-ATX,ATX,Micro-ATX,Mini-ITX', 426, 167, N'360mm,280mm,240mm'),
    ('CASE-ASUS-ROG-HYPERION', N'E-ATX,ATX,Micro-ATX,Mini-ITX', 460, 190, N'420mm,360mm')
) v(SKU, Supported, MaxGPU, MaxCooler, Radiator) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.Case_Specs s WHERE s.ComponentID = c.ComponentID);

-- 8. Cooling_Specs
INSERT dbo.Cooling_Specs(ComponentID, CoolingType, SupportedSockets, HeightMM, RadiatorSizeMM, TDP_Rating_W)
SELECT c.ComponentID, v.CoolingType, v.Sockets, v.Height, v.Rad, v.TDP
FROM dbo.Components c
JOIN (VALUES
    ('COOL-DEEPCOOL-AG400', 'Air', N'AM4,AM5,LGA1700,LGA1200', 150, NULL, 220),
    ('COOL-THERMALRIGHT-PA120', 'Air', N'AM4,AM5,LGA1700,LGA1200', 155, NULL, 265),
    ('COOL-DEEPCOOL-LT520', 'Liquid', N'AM4,AM5,LGA1700,LGA1200', 52, 240, 280),
    ('COOL-CORSAIR-H150I', 'Liquid', N'AM4,AM5,LGA1700,LGA1200', 52, 360, 320),
    ('COOL-ASUS-RYUJIN3', 'Liquid', N'AM4,AM5,LGA1700,LGA1200', 52, 360, 350)
) v(SKU, CoolingType, Sockets, Height, Rad, TDP) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.Cooling_Specs s WHERE s.ComponentID = c.ComponentID);
GO

/* ==================================================================================
   C. ĐIỂM BENCHMARK HIỆU NĂNG CHO CPU & GPU
   ================================================================================== */

-- Điểm CPU Multi-Core
INSERT dbo.BenchmarkScores(ComponentID, MetricCode, BenchmarkName, Score, SourceName, SourceUrl, IsVerified)
SELECT c.ComponentID, 'CPU_MULTI', N'Cinebench / Geekbench Multi-Core Index', v.Score, N'PassMark & Cinebench Aggregated', NULL, 1
FROM dbo.Components c
JOIN (VALUES
    ('CPU-INTEL-I3-12100F', 8500.0),
    ('CPU-AMD-R5-5600', 11200.0),
    ('CPU-INTEL-I5-13400F', 15800.0),
    ('CPU-INTEL-I5-14600K', 24500.0),
    ('CPU-AMD-R7-7700X', 20000.0),
    ('CPU-INTEL-I7-14700K', 34500.0),
    ('CPU-AMD-R7-7800X3D', 28000.0),
    ('CPU-INTEL-I9-14900K', 39500.0),
    ('CPU-AMD-R9-7950X3D', 38500.0),
    ('CPU-INTEL-I9-14900KS', 42000.0)
) v(SKU, Score) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.BenchmarkScores b WHERE b.ComponentID = c.ComponentID AND b.MetricCode = 'CPU_MULTI');

-- Điểm GPU Gaming
INSERT dbo.BenchmarkScores(ComponentID, MetricCode, BenchmarkName, Score, SourceName, SourceUrl, IsVerified)
SELECT c.ComponentID, 'GPU_GAMING', N'3DMark TimeSpy / Gaming Index', v.Score, N'3DMark Benchmark Aggregated', NULL, 1
FROM dbo.Components c
JOIN (VALUES
    ('GPU-MSI-GTX1650', 4100.0),
    ('GPU-ASUS-RTX3050-6G', 6200.0),
    ('GPU-MSI-RX6600', 8600.0),
    ('GPU-GIGA-RTX4060', 11200.0),
    ('GPU-ASUS-RTX4060TI', 14000.0),
    ('GPU-GIGA-RTX4070S', 20500.0),
    ('GPU-MSI-RTX4070TIS', 24500.0),
    ('GPU-ASUS-RTX4080S', 30500.0),
    ('GPU-GIGA-RTX4090', 39000.0),
    ('GPU-ASUS-ROG-RTX4090', 41500.0)
) v(SKU, Score) ON v.SKU = c.SKU
WHERE NOT EXISTS (SELECT 1 FROM dbo.BenchmarkScores b WHERE b.ComponentID = c.ComponentID AND b.MetricCode = 'GPU_GAMING');
GO
