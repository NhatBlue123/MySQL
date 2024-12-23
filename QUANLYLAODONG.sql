﻿SELECT * FROM CONGTRINH;
SELECT * FROM DIADIEM_CONGTRINH;
SELECT * FROM PHONGBAN;
SELECT * FROM NHANVIEN;
SELECT * FROM SOLUONGNGAYCONG;

--INSERT INTO [dbo].[SOLUONGNGAYCONG]
--VALUES('CT001','NV011',22),
--('CT002','NV012',10),
--('CT003','NV013',18),
--('CT004','NV014',39),
--('CT005','NV015',9),
--('CT006','NV016',24),
--('CT007','NV017',13),
--('CT001','NV018',30)



--3.1
SELECT MAPB,TENPB
FROM [dbo].[PHONGBAN]
WHERE MAPB = 'PB001' AND MAPB = 'PB002'
--3.2
SELECT MANV,HOTEN,NGAYSINH,DIACHI
FROM [dbo].[NHANVIEN]
WHERE DIACHI = N'Đà Nẵng'

--3.3
SELECT PB.MAPB, PB.TENPB, NV.HOTEN AS TENNHANVIEN
FROM [dbo].[PHONGBAN] AS PB, [dbo].[NHANVIEN] AS NV
WHERE PB.MAPB = NV.MAPB AND PB.MAPB = 'PB001';

--3.4
SELECT MANV, HOTEN, NGAYSINH, DIACHI, MAPB
FROM NHANVIEN
WHERE NGAYSINH < '1982-01-01';

--UPDATE NHANVIEN
--SET PHAI = CASE
---    WHEN MANV IN ('NV001', 'NV003','NV004','NV006','NV008','NV010','NV011','NV015') THEN 1
--    WHEN MANV IN ('NV002', 'NV005','NV007','NV009','NV013','NV012','NV014') THEN 0
--    ELSE PHAI
--END;
--3.5
SELECT *
FROM [dbo].[NHANVIEN]
WHERE PHAI = 0 AND DIACHI = N'Quảng Nam';

--3.6
SELECT NV.MANV,NV.HOTEN, SLNC.SOLUONG AS SONGAYCONG
FROM [dbo].[SOLUONGNGAYCONG] AS SLNC,[dbo].[NHANVIEN] AS NV
WHERE SLNC.MANV = NV.MANV 
AND SLNC.MACT = 'CT001';

SELECT NV.MANV, NV.HOTEN, SLNC.SOLUONG AS SONGAYCONG
FROM [dbo].[SOLUONGNGAYCONG] AS SLNC
INNER JOIN [dbo].[NHANVIEN] AS NV
    ON SLNC.MANV = NV.MANV
WHERE SLNC.MACT = 'CT001';

--3.7
SELECT CT.MACT,CT.TENCT,CT.NGAYHT,SLNC.SOLUONG AS SOLUONGNGAYCONG
FROM [dbo].[CONGTRINH] AS CT,[dbo].[SOLUONGNGAYCONG] AS SLNC
WHERE CT.MACT = SLNC.MACT AND CT.NGAYHT <= GETDATE()

SELECT CT.MACT, CT.TENCT, CT.NGAYHT, SLNC.SOLUONG AS SOLUONGNGAYCONG
FROM [dbo].[CONGTRINH] AS CT
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
    ON CT.MACT = SLNC.MACT
WHERE CT.NGAYHT <= GETDATE();

--3.8
SELECT NV.MANV, NV.HOTEN, SLNC.MACT, DATEDIFF(YEAR, NV.NGAYSINH, GETDATE()) AS TUOI
FROM [dbo].[NHANVIEN] AS NV
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
    ON NV.MANV = SLNC.MANV
INNER JOIN [dbo].[CONGTRINH] AS CT
    ON SLNC.MACT = CT.MACT
WHERE NV.PHAI = 0  -- Nữ
    AND DATEDIFF(YEAR, NV.NGAYSINH, GETDATE()) <= 18;

--, 'NV003','NV004','NV006','NV008','NV010','NV011','NV015'
--, 'NV005','NV007','NV009','NV013','NV012','NV014'

--3.10

SELECT TOP 1 NV.LUONG
FROM [dbo].[NHANVIEN] AS NV
INNER JOIN [dbo].[PHONGBAN] AS PB
   ON PB.MAPB = NV.MAPB
WHERE PB.TENPB = N'Tổng hợp'
ORDER BY NV.LUONG DESC

--3.11
SELECT TOP 1 PB.MAPB, PB.TENPB, AVG(NV.LUONG) AS LUONGTB
FROM [dbo].[PHONGBAN] AS PB
INNER JOIN [dbo].[NHANVIEN] AS NV
    ON PB.MAPB = NV.MAPB
GROUP BY PB.MAPB, PB.TENPB
ORDER BY AVG(NV.LUONG) ASC;

--3.12
SELECT PB.MAPB, PB.TENPB, SUM(NV.LUONG) AS TONGLUONG
FROM [dbo].[PHONGBAN] AS PB
INNER JOIN [dbo].[NHANVIEN] AS NV
    ON PB.MAPB = NV.MAPB
GROUP BY PB.MAPB, PB.TENPB

--3.13
SELECT AVG(DATEDIFF(YEAR, NV.NGAYSINH, GETDATE())) AS TUOITB
FROM [dbo].[NHANVIEN] AS NV

--3.14
SELECT TOP 1 NV.DIACHI, COUNT(*) AS SOLUONGNHANVIEN
FROM [dbo].[NHANVIEN] AS NV
GROUP BY NV.DIACHI
ORDER BY SOLUONGNHANVIEN DESC

--3.15
SELECT NV.MANV,NV.HOTEN,PB.TENPB,NV.LUONG AS HSL,((SLNC.SOLUONG/26)*(NV.LUONG*3000)) AS LUONG
FROM [dbo].[NHANVIEN] AS NV
INNER JOIN [dbo].[PHONGBAN] AS PB
ON PB.MAPB = NV.MAPB
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
ON SLNC.MANV = NV.MANV

--3.16

SELECT NV.PHAI , SUM(NV.LUONG) AS TONGLUONG
FROM [dbo].[NHANVIEN] AS NV
GROUP BY NV.PHAI

--3.17
DELETE FROM [dbo].[CONGTRINH]
WHERE NGAYKC > GETDATE();

--3.18
UPDATE [dbo].[NHANVIEN]
SET LUONG = LUONG * 1.5
WHERE MAPB = 'PB001'

--3.19
SELECT MACT, TENCT, NGAYCAPGP, NGAYKC
FROM [dbo].[CONGTRINH]
WHERE NGAYKC IS NOT NULL AND NGAYCAPGP IS NULL;

--3.20
-- Bước 1: Lấy mức lương cao nhất của từng phòng ban
SELECT MAPB, MAX(LUONG) AS LUONGCAONHAT
INTO #TEMP_LUONGCAONHAT -- Tạo bảng tạm lưu kết quả
FROM [dbo].[NHANVIEN]
GROUP BY MAPB;

-- Bước 2: Lấy thông tin nhân viên có mức lương cao nhất
SELECT 
    PB.TENPB, 
    NV.HOTEN, 
    NV.LUONG
FROM [dbo].[NHANVIEN] NV
INNER JOIN [dbo].[PHONGBAN] PB
    ON NV.MAPB = PB.MAPB
INNER JOIN #TEMP_LUONGCAONHAT TL
    ON NV.MAPB = TL.MAPB AND NV.LUONG = TL.LUONGCAONHAT;

DROP TABLE #TEMP_LUONGCAONHAT;

--4.4
SELECT * FROM NHANVIEN;
SELECT * FROM CONGTRINH;
SELECT * FROM SOLUONGNGAYCONG;


SELECT PB.TENPB,NV.HOTEN
FROM [dbo].[PHONGBAN] AS PB
INNER JOIN [dbo].[NHANVIEN] AS NV
ON NV.MAPB = PB.MAPB
WHERE NV.MANV NOT IN(
                 SELECT SLNC.MANV
				 FROM [dbo].[SOLUONGNGAYCONG] AS SLNC)

--4.5
SELECT 
    PB.MAPB,
    PB.TENPB,
    SUM(SLNC.SOLUONG) AS TONGNGAYCONG
FROM [dbo].[PHONGBAN] AS PB
INNER JOIN [dbo].[NHANVIEN] AS NV
    ON PB.MAPB = NV.MAPB
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
    ON NV.MANV = SLNC.MANV
INNER JOIN [dbo].[CONGTRINH] AS CT
    ON SLNC.MACT = CT.MACT
INNER JOIN [dbo].[DIADIEM_CONGTRINH] AS DDCT
    ON DDCT.MACT = CT.MACT
WHERE 
    DDCT.DIADIEM = N'Đà Nẵng'
GROUP BY 
    PB.MAPB, PB.TENPB
HAVING 
    SUM(SLNC.SOLUONG) > 50;

--4.6
--UPDATE NHANVIEN
--SET PHAI = CASE
---    WHEN MANV IN ('NV001', 'NV003','NV004','NV006','NV008','NV010','NV011','NV015') THEN 1
--    WHEN MANV IN ('NV002', 'NV005','NV007','NV009','NV013','NV012','NV014') THEN 0
--    ELSE PHAI
--END;
SELECT NV.MANV,NV.HOTEN,SLNC.SOLUONG,CASE
        WHEN SLNC.SOLUONG > 40 THEN 'A'
        WHEN SLNC.SOLUONG > 30 AND SLNC.SOLUONG <= 40  THEN 'B'
		WHEN SLNC.SOLUONG > 20 AND SLNC.SOLUONG <= 30  THEN 'C'
		WHEN SLNC.SOLUONG > 10 AND SLNC.SOLUONG <= 20  THEN 'D'
        ELSE 'F'
END AS XEPLOAI,
CASE
        WHEN SLNC.SOLUONG > 40 THEN '2000'
        WHEN SLNC.SOLUONG > 30 AND SLNC.SOLUONG <= 40  THEN '1500'
		WHEN SLNC.SOLUONG > 20 AND SLNC.SOLUONG <= 30  THEN '1000'
		WHEN SLNC.SOLUONG > 10 AND SLNC.SOLUONG <= 20  THEN '500'
        ELSE '0'
END AS THUONG
FROM [dbo].[NHANVIEN] AS NV
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
ON SLNC.MANV = NV.MANV

--4.7
SELECT TOP 1 PB.TENPB ,NV.MANV,NV.HOTEN,SLNC.SOLUONG
FROM [dbo].[NHANVIEN] AS NV
INNER JOIN [dbo].[PHONGBAN] AS PB
ON PB.MAPB = NV.MAPB
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
ON SLNC.MANV = NV.MANV
ORDER BY SLNC.SOLUONG DESC

WITH RankedData AS (
    SELECT 
        PB.MAPB,
        PB.TENPB,
        NV.MANV,
        NV.HOTEN,
        SLNC.SOLUONG,
        ROW_NUMBER() OVER (PARTITION BY PB.MAPB ORDER BY SLNC.SOLUONG DESC) AS RN
    FROM [dbo].[PHONGBAN] AS PB
    INNER JOIN [dbo].[NHANVIEN] AS NV
        ON PB.MAPB = NV.MAPB
    INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
        ON SLNC.MANV = NV.MANV
)
SELECT 
    MAPB,
    TENPB,
    MANV,
    HOTEN,
    SOLUONG
FROM RankedData
WHERE RN = 1;


--4.8
SELECT PB.TENPB,NV.HOTEN,CT.TENCT,DDCT.DIADIEM
FROM [dbo].[PHONGBAN] AS PB
INNER JOIN [dbo].[NHANVIEN] AS NV
ON PB.MAPB = NV.MAPB
INNER JOIN [dbo].[SOLUONGNGAYCONG] AS SLNC
ON SLNC.MANV = NV.MANV
INNER JOIN [dbo].[CONGTRINH] AS CT
ON SLNC.MACT = CT.MACT
INNER JOIN [dbo].[DIADIEM_CONGTRINH] AS DDCT
ON CT.MACT = DDCT.MACT
WHERE DDCT.DIADIEM = N'Đà Nẵng'

--4.9
DELETE FROM [dbo].[NHANVIEN]
WHERE MANV NOT IN (
    SELECT DISTINCT MANV
    FROM [dbo].[SOLUONGNGAYCONG]
);

