use congty;
-- cau 1
-- INSERT INTO phongban
-- VALUES('PB06','Phòng Kỹ Thuật')

-- cau2
-- INSERT INTO nhanvien(MaNV,HoTen,NamSinh,DiaChi,SoDienThoai,Luong,MaPB,GioiTinh)
-- VALUES('NV12','Lê Văn Anh','1982','Hà Nội','0905222507',12390,'PB06',1)

-- cau3
-- UPDATE nhanvien
-- SET luong = luong + 10000
-- WHERE nhanvien.MaPB IN (
--                      SELECT phongban.MaPB
--                      FROM phongban
-- 					 WHERE phongban.TenPhongBan = 'Phòng Kỹ Thuật'
--                      )

-- cau 4
-- UPDATE nhanvien nv
-- SET nv.SoDienThoai = '0905123456'
-- WHERE nv.MaNV = 'NV04'

-- cau 5
-- DELETE FROM nhanvien
-- WHERE nhanvien.MaNV = 'NV05'

-- cau 6
-- DELETE FROM phongban pb
-- WHERE pb.MaPB NOT IN (
--                   SELECT nhanvien.MaPB
--                   FROM nhanvien)

-- cau 7
