---Ho ten: Nguyen Phu Hao---
---MSSV:   21520223---

USE QuanLyBanhang

														---PHAN III---
---Cau 15---
SELECT MASP,TENSP
FROM SANPHAM
EXCEPT 
SELECT CTHD.MASP, TENSP
FROM CTHD INNER JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP
---Cau 16---
SELECT SP.MASP,SP.TENSP 
FROM SANPHAM AS SP
WHERE NOT EXISTS (
 SELECT MASP 
 FROM CTHD
  INNER JOIN dbo.HOADON AS HD ON HD.SOHD = CTHD.SOHD
 WHERE CTHD.MASP = SP.MASP AND YEAR(HD.NGHD)=2006)
 ---Cau 17---
 SELECT MASP, TENSP
 FROM SANPHAM AS SP
WHERE SP.NUOCSX = 'Trung Quoc' AND SP.MASP NOT IN(
SELECT CT.MASP
FROM HOADON AS HD INNER JOIN CTHD AS CT ON CT.SOHD =HD.SOHD
WHERE YEAR(HD.NGHD) = 2006)
---Cach 2---
SELECT MASP, TENSP
FROM SANPHAM AS SP
WHERE NUOCSX = 'Trung Quoc' AND NOT EXISTS(
SELECT* FROM CTHD INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD INNER JOIN SANPHAM ON SANPHAM.MASP = CTHD.MASP
WHERE YEAR(NGHD) = 2006 AND NUOCSX = 'Trung Quoc' AND CTHD.MASP = SP.MASP)
---Cau 18---
SELECT SOHD
FROM HOADON AS HD
WHERE NOT EXISTS(
SELECT MASP 
FROM SANPHAM AS SP
WHERE NUOCSX = 'Singapore' AND NOT EXISTS(
SELECT  * FROM CTHD
WHERE CTHD.SOHD = HD.SOHD AND CTHD.MASP=SP.MASP))
---Cau 19 BAI THUC HANH 4 LAM ---
---Cau 20---
SELECT COUNT(*)AS KHKPTHANHVIEN
FROM HOADON
WHERE MAKH IS NULL
---Cau 21---
SELECT COUNT(CTHD.MASP)
FROM HOADON AS HD
 INNER JOIN dbo.CTHD ON CTHD.SOHD = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006
---Cau 22---
SELECT MAX(HD.TRIGIA) AS TRIGIACCAONHAT, MIN(HD.TRIGIA) AS TRIGIATHAPNHAT
FROM HOADON AS HD
---Cau 23---
SELECT AVG(HD.TRIGIA) AS TRIGIATRUNGBINH
FROM dbo.HOADON AS HD
WHERE YEAR(HD.NGHD) = 2006
---Cau 24---
SELECT SUM(HD.TRIGIA) AS DOANHTHU
FROM dbo.HOADON AS HD
WHERE YEAR(HD.NGHD) = 2006
---Cau 25---
SELECT SOHD
FROM HOADON
WHERE TRIGIA= (SELECT MAX(TRIGIA) 
FROM HOADON 
WHERE YEAR(NGHD) =2006 )
---Cau 26---
SELECT KH.HOTEN 
FROM HOADON AS HD INNER JOIN KHACHHANG AS KH ON KH.MAKH = HD.MAKH
WHERE HD.TRIGIA = (SELECT MAX(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) =2006 )
--Cau 27---
SELECT TOP (3) MAKH,HOTEN
FROM KHACHHANG 
ORDER BY DOANHSO DESC
---Cau 28---
SELECT MASP,TENSP
FROM SANPHAM
WHERE GIA IN (
SELECT TOP (3) GIA
FROM SANPHAM
ORDER BY GIA DESC)
 ---Cau 29---
SELECT MASP,TENSP 
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA IN (
SELECT TOP (3) GIA FROM SANPHAM
ORDER BY GIA DESC)
---Cau 30---
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA IN (
SELECT  DISTINCT TOP (3) GIA 
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
ORDER BY GIA DESC)

		