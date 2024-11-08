use congty;
-- cau 2
-- SELECT MaPB,TenPhongBan
-- FROM PhongBan
-- WHERE MaPB = 'PB01' OR MaPB = 'PB02'
-- cau 3
-- SELECT MaNV,HoTen,NamSinh,DiaChi
-- FROM NhanVien
-- WHERE DiaChi = 'Da Nang'

-- cau 4
-- SELECT pb.MaPB, pb.TenPhongBan, nv.HoTen, nv.NamSinh
-- FROM PhongBan AS pb
-- JOIN NhanVien AS nv ON pb.MaPB = nv.MaPB
-- WHERE pb.MaPB = 'PB01';
-- cau 5
-- SELECT *
-- FROM NhanVien
-- WHERE NamSinh > 1982
-- ORDER BY NamSinh DESC
-- cau 6
-- SELECT *
-- FROM NhanVien
-- WHERE NamSinh BETWEEN YEAR(CURDATE()) - 50 AND YEAR(CURDATE()) - 40
-- ORDER BY NamSinh
-- cau 7
-- SELECT *
-- FROM NhanVien
-- WHERE GioiTinh = 0 AND DiaChi = 'Quang Nam'
-- cau 8
-- SELECT *
-- FROM NhanVien
-- ORDER BY Luong DESC
-- LIMIT 1
-- cau 9
SELECT *
FROM PhongBan
JOIN NhanVien ON PhongBan.MaPB = 'PB04' AND NhanVien.MaPB = 'PB04'


