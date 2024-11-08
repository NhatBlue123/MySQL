use congty;
-- cau 6
-- SELECT pb.TenPhongBan,COUNT(nv.MaNV)
-- FROM phongban pb,nhanvien nv
-- WHERE pb.MaPB = nv.MaPB
-- group by pb.TenPhongBan

-- cau 7
-- SELECT pb.TenPhongBan,COUNT(nv.MaNV) AS SoLuongNhanVien
-- FROM PhongBan pb,NhanVien nv
-- WHERE pb.MaPB = nv.MaPB
-- group by pb.TenPhongBan
-- ORDER BY COUNT(nv.MaNV) DESC
-- LIMIT 1

-- cau 8
-- SELECT nv.DiaChi, AVG(year(current_date() - nv.NamSinh)) AS TuoiTrungBinh
-- FROM nhanvien nv
-- group by nv.DiaChi
-- order by  TuoiTrungBinh DESC
-- LIMIT 1

-- cau 9
-- SELECT nv.DiaChi AS Tinh,COUNT(nv.MaNV) AS SoLuong,AVG(nv.Luong) AS LuongTB
-- FROM nhanvien nv
-- GROUP BY nv.DiaChi
-- HAVING COUNT(nv.MaNV) > 2

-- cau 10
-- SELECT pb.MaPB,pb.TenPhongBan,SUM(nv.Luong) AS TongLuong
-- FROM phongban pb,nhanvien nv
-- WHERE pb.MaPB = nv.MaPB
-- GROUP BY pb.MaPB,pb.TenPhongBan
-- HAVING SUM(nv.luong) > 10000
-- ORDER BY TongLuong DESC

-- cau11
-- SELECT nv.DiaChi,AVG(nv.Luong) AS TongLuong
-- FROM NhanVien nv
-- WHERE nv.SoDienThoai IS NOT NULL AND nv.DiaChi IN ('Da Nang','Quang Nam')
-- GROUP BY nv.DiaChi
-- HAVING AVG(nv.luong) > 10000
-- ORDER BY TongLuong DESC

-- cau12
-- SELECT nv.GioiTinh,COUNT(nv.MaNV) AS SoLuong
-- FROM nhanvien nv
-- WHERE nv.NamSinh IS NOT NULL AND nv.MaPB IN ('PB01','PB02')
-- GROUP BY nv.GioiTinh

-- cau13
SELECT nv.NamSinh,COUNT(nv.MaNV) AS SoLuongNV
FROM NhanVien nv
WHERE nv.NamSinh > 1980
group by nv.NamSinh