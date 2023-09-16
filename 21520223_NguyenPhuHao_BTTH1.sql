---CSDL Quan LY Ban Hang
CREATE DATABASE QuanLyBanHang
USE QuanLybanHang
---Phan 1---
---CAU 1---
CREATE TABLE KHACHHANG(
MAKH CHAR(4) PRIMARY KEY,
HOTEN VARCHAR(40),
DCHI VARCHAR(50),
SODT VARCHAR(20),
NGSINH SMALLDATETIME,
NGDK SMALLDATETIME,
DOANHSO MONEY,
)
CREATE TABLE NHANVIEN(
MANV CHAR(4) PRIMARY KEY,
HOTEN VARCHAR(40),
SODT VARCHAR(20),
NGVL SMALLDATETIME,
)
CREATE TABLE SANPHAM(
MASP CHAR(4) PRIMARY KEY,
TENSP VARCHAR(40),
DVT VARCHAR(20),
NUOCSX VARCHAR(40),
GIA MONEY,
)
CREATE TABLE HOADON(
SOHD INT PRIMARY KEY,
NGHD SMALLDATETIME,
MAKH CHAR(4),
MANV CHAR(4),
TRIGIA MONEY,
)
ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
CREATE TABLE CTHD(
SOHD INT,
MASP CHAR(4),
SL INT,
PRIMARY KEY(SOHD, MASP)
)
ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_SOHD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)
GO
ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_SP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
---CAU 2---
ALTER TABLE SANPHAM
ADD GHICHU VARCHAR(20) NULL

ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(50) NULL
---CAU 3---
ALTER TABLE KHACHHANG
ADD LOAIKH TINYINT NULL
---CAU 4---
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100)
---CAU 5---
ALTER TABLE SANPHAM
DROP COLUMN GHICHU
---CAU 6---
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH VARCHAR(20) NULL
---CAU 7---
ALTER TABLE SANPHAM
ADD CONSTRAINT CT_DVT CHECK(DVT IN('cay', 'hop', 'cai', 'chuc', 'quyen'))
---CAU 8---
ALTER TABLE SANPHAM
ADD CONSTRAINT CT_GIA CHECK(GIA>=500)
---CAU 9---
ALTER TABLE CTHD
ADD CONSTRAINT CT_SL CHECK(SL>=1)
---Phan 2---
SET DATEFORMAT dmy;

INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '13/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '21/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV03', 'Nguyen Van B', '0997047382', '27/4/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV04', 'Ngo Thanh Tuan', '0913758498', '24/6/2006')
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '20/7/2006')

INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH01', 'Nguyen Van A', '731, Tran Hung Dao, Q5, TPHCM', '08823451', '22/10/1960', 13060000, '22/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '03/04/1974', 280000, '30/07/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '12/06/1980', 3860000, '05/08/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai hanh, Q10, TpHCM', '0917325476', '09/03/1965', 250000, '02/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TPHCM', '08246108', '10/03/1960', 21000, '28/10/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '31/12/1981', 915000, '24/11/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '06/04/1971', 12500, '01/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TPHCM', '0938435756', '10/01/1971', 365000, '13/12/2006')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TPHCM', '08654763', '03/09/1979', 70000, '14/01/2007')
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TPHCM', '08768904', '02/05/1963', 67500, '16/01/2007')



INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC01', 'But Chi', 'cay', 'Singapore', 3000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC02', 'But Chi', 'cay', 'Singapore', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC03', 'But Chi', 'cay', 'Viet Nam', 3500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BC04', 'But Chi', 'hop', 'Viet Nam', 30000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB01', 'But bi', 'cay', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB02', 'But bi', 'cay', 'Trung Quoc', 7000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('BB03', 'But bi', 'hop', 'Thai Lan', 100000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('TV07', 'Tap 100 trang', 'chuc', 'Viet Nam', 34000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST01', 'So tay 500 trang', 'quyen', 'Viet Nam', 40000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST04', 'So tay', 'quyen', 'Thai Lan', 55000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST09', 'But long', 'cay', 'Viet Nam', 5000)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES ('ST10', 'But long', 'cay', 'Trung Quoc', 7000)

INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1001, '23/07/2006', 'KH01', 'NV01', 320000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1002, '12/08/2006', 'KH01', 'NV02', 840000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1003, '23/06/2006', 'KH02', 'NV01', 100000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1004, '01/09/2006', 'KH02', 'NV01', 180000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1005, '20/10/2006', 'KH01', 'NV02', 3800000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1006, '16/10/2006', 'KH01', 'NV03', 2430000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1007, '28/10/2006', 'KH03', 'NV03', 510000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1008, '28/10/2006', 'KH01', 'NV03', 440000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1009, '28/10/2006', 'KH03', 'NV04', 320000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1010, '01/11/2006', 'KH01', 'NV01', 5200000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1011, '04/11/2006', 'KH04', 'NV03', 250000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1012, '30/11/2006', 'KH05', 'NV03', 21000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1013, '12/12/2006', 'KH06', 'NV01', 5000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1014, '31/12/2006', 'KH03', 'NV02', 3150000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1015, '01/01/2007', 'KH06', 'NV01', 910000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1016, '01/01/2007', 'KH07', 'NV02', 12500)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1017, '02/01/2007', 'KH08', 'NV03', 35000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1018, '13/01/2007', 'KH08', 'NV03', 330000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1019, '13/01/2007', 'KH01', 'NV03', 30000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1020, '14/01/2007', 'KH09', 'NV04', 70000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1021, '16/01/2007', 'KH10', 'NV04', 67500)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1022, '16/01/2007', Null, 'NV03', 7000)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES (1023, '17/01/2007', Null, 'NV01', 330000)

INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'ST01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'BC01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'BC02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'ST08', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BC04', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB01', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB02', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1002, 'BB03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV01', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1004, 'TV04', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1005, 'TV05', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1005, 'TV06', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1001, 'TV07', 20)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1006, 'ST01', 30)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1006, 'ST02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1007, 'ST03', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1008, 'ST04', 8)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1009, 'ST05', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'TV07', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST07', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST08', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'ST04', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1010, 'TV03', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1011, 'ST06', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1012, 'ST07', 3)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1013, 'ST08', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BC02', 80)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BB02', 100)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BC04', 60)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1014, 'BB01', 50)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1015, 'BB02', 30)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1015, 'BB03', 7)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1016, 'TV01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV02', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV03', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1017, 'TV04', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1018, 'ST04', 6)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1019, 'ST05', 1)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1019, 'ST06', 2)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1020, 'ST07', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'ST08', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'TV01', 7)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1021, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1022, 'TV02', 10)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'ST04', 6)

INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'BC01', 5)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES (1023, 'BC02', 1)

SET DATEFORMAT DMY
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP) VALUES ('KHMT', 'Khoa Hoc May Tinh', '7/6/2005')
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP) VALUES ('HTTT', 'He thong thong tin', '7/6/2005')
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP) VALUES ('CNPM', 'Cong nghe phan mem', '7/6/2005')
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP) VALUES ('MTT', 'Mang va truyen thong', '7/6/2005')
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP) VALUES ('KTMT', 'Ky thuat may tinh', '7/6/2005')

INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '1/11/2004', 5.00, 2250000, 'KHMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '17/12/1965', '20/4/2004', 4.50, 2025000, 'HTTT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1/8/1950', '23/9/2004', 4.00, 1800000, 'CNPM')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '22/2/1961', '12/1/2005', 4.50, 2025000, 'KTMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '12/3/1958', '12/1/2005', 3.00, 1350000, 'HTTT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '11/3/1953', '12/1/2005', 4.50, 2025000, 'KHMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '23/11/1971', '1/3/2005', 4.00, 1800000, 'KHMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV08', 'Le Thi Tran', 'KS', Null, 'Nu', '26/3/1974', '1/3/2005', 1.69, 760500, 'KHMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '31/12/1966', '1/3/2005', 4.00, 1800000, 'HTTT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV10', 'Le Tran Anh Loan', 'KS', Null, 'Nu', '17/7/1972', '1/3/2005', 1.86, 837000, 'CNPM')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/1/1980', '15/5/2005', 2.67, 1201500, 'MTT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV12', 'Tran Van Anh', 'CN', Null, 'Nu', '29/3/1981', '15/5/2005', 1.69, 760500, 'CNPM')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV13', 'Nguyen Linh Dan', 'CN', Null, 'Nu', '23/5/1980', '15/5/2005', 1.69, 760500, 'KTMT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/11/1976', '15/5/2005', 3.00, 1350000, 'MTT')
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '4/5/1978', '15/5/2005', 3.00, 1350000, 'KHMT')

UPDATE KHOA SET TRGKHOA = 'GV01' WHERE MAKHOA = 'KHMT'
UPDATE KHOA SET TRGKHOA = 'GV02' WHERE MAKHOA = 'HTTT'
UPDATE KHOA SET TRGKHOA = 'GV04' WHERE MAKHOA = 'CNPM'
UPDATE KHOA SET TRGKHOA = 'GV03' WHERE MAKHOA = 'MTT'

INSERT INTO LOP (MALOP, TENLOP, SISO, MAGVCN) VALUES ('K11', 'Lop 1 khoa 1', 11, 'GV07')
INSERT INTO LOP (MALOP, TENLOP, SISO, MAGVCN) VALUES ('K12', 'Lop 2 khoa 1', 12, 'GV09')
INSERT INTO LOP (MALOP, TENLOP, SISO, MAGVCN) VALUES ('K13', 'Lop 3 khoa 1', 12, 'GV14')

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('CSDL', 'Co so du lieu', 3, 1, 'HTTT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('KTMT', 'Kien truc may tinh', 3, 1, 'KTMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('TKCSDL', 'Thiet ke co so du lieu', 3, 0, 'HTTT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('HDH', 'He dieu hanh', 4, 0, 'KTMT')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM')
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES ('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM')


SET DATEFORMAT DMY
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'THDC', 'GV07', 1, 2006, '2/1/2006', '12/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K12', 'THDC', 'GV06', 1, 2006, '2/1/2006', '12/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K13', 'THDC', 'GV15', 1, 2006, '2/1/2006', '12/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K12', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K13', 'CTRR', 'GV08', 2, 2006, '9/1/2006', '17/5/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'CSDL', 'GV05', 2, 2006, '1/6/2006', '15/7/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K12', 'CSDL', 'GV09', 2, 2006, '1/6/2006', '15/7/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K13', 'CTDLGT', 'GV15', 2, 2006, '1/6/2006', '15/7/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K13', 'CSDL', 'GV05', 3, 2006, '1/8/2006', '15/12/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K13', 'DHMT', 'GV07', 3, 2006, '1/8/2006', '15/12/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K12', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'HDH', 'GV04', 1, 2007, '2/1/2007', '18/2/2007')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K12', 'HDH', 'GV04', 1, 2007, '2/1/2007', '20/3/2007')
INSERT INTO GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES ('K11', 'DHMT', 'GV07', 1, 2007, '2/1/2007', '20/3/2007')