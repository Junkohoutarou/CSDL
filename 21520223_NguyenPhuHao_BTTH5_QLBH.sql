﻿USE QuanLyBanHang
---Nguyen Phu Hao---
--- 21520223---

																	--- Phan I ---
--- Cau 10 ---
CREATE TRIGGER TRG_KH_INSERT ON KHACHHANG
FOR INSERT
AS 
BEGIN
	DECLARE @NGAYDANGKY SMALLDATETIME, @NGAYSINH SMALLDATETIME
	SELECT @NGAYDANGKY=NGDK, @NGAYSINH=NGSINH FROM KHACHHANG
	IF(@NGAYDANGKY <= @NGAYDANGKY)
		BEGIN
			PRINT ('LOI')
			ROLLBACK TRANSACTION
		END
		ELSE PRINT ('THANHCONG')
END	

--- Cau 11 ---
CREATE TRIGGER TRG_HD_INSERT ON HOADON
FOR INSERT 
AS
BEGIN
	DECLARE @NGAYMUA SMALLDATETIME, @NGAYDK SMALLDATETIME, @KHACHHANG CHAR(4)
	SELECT @NGAYMUA = NGHD, @KHACHHANG = MAKH FROM INSERTED
	
	SELECT @NGAYDK = NGDK FROM KHACHHANG
	WHERE MAKH = @KHACHHANG
	IF (@NGAYMUA < @NGAYDK)
	BEGIN
		PRINT ('LOI')
		ROLLBACK TRANSACTION
	END
	ELSE
		PRINT ('THANH CONG')
END

--- Cau 12 ---
CREATE TRIGGER TRG_HD_NV ON HOADON 
FOR INSERT
AS
BEGIN
	DECLARE @NGHD SMALLDATETIME, @NGVL SMALLDATETIME, @MANV CHAR(4)
	SELECT @NGHD = NGHD, @MANV = MANV FROM INSERTED
	SELECT	@NGVL = NGVL FROM NHANVIEN WHERE MANV = @MANV

	IF (@NGHD >= @NGVL)
		PRINT ('Thêm mới một hóa đơn thành công.')
	ELSE
	BEGIN
		PRINT ('Lỗi: Ngày bán hàng của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.')
		ROLLBACK TRANSACTION
	END
END

--- Cau 13 ---
CREATE TRIGGER TRIG_HD_CTHD ON HOADON FOR INSERT
AS
BEGIN
	DECLARE @SOHD INT, @COUNT_SOHD INT
	SELECT @SOHD = SOHD FROM INSERTED
	SELECT @COUNT_SOHD = COUNT(SOHD) FROM CTHD WHERE SOHD = @SOHD

	IF (@COUNT_SOHD >= 1)
		PRINT ('Thêm mới một hóa đơn thành công.')
	ELSE
	BEGIN
		PRINT ('Lỗi: Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.')
		ROLLBACK TRANSACTION
	END
END

--- Cau 14 ---
CREATE TRIGGER TRI_CTHD ON CTHD FOR INSERT, DELETE
AS
BEGIN
	DECLARE @SOHD INT, @TONGGIATRI INT

	SELECT @TONGGIATRI = SUM(SL * GIA), @SOHD = SOHD 
	FROM INSERTED INNER JOIN SANPHAM
	ON INSERTED.MASP = SANPHAM.MASP
	GROUP BY SOHD

	UPDATE HOADON
	SET TRIGIA += @TONGGIATRI
	WHERE SOHD = @SOHD
END
GO 

CREATE TRIGGER TRI_DEL_CTHD ON CTHD 
FOR DELETE
AS
BEGIN
	DECLARE @SOHD INT, @GIATRI INT

	SELECT @SOHD = SOHD, @GIATRI = SL * GIA 
	FROM DELETED INNER JOIN SANPHAM 
	ON SANPHAM.MASP = DELETED.MASP
	UPDATE HOADON
	SET TRIGIA -= @GIATRI
	WHERE SOHD = @SOHD
END

--- Cau 15 ---
go
CREATE TRIGGER UPDATE_KHACHHANG ON KHACHHANG
FOR UPDATE
AS
BEGIN
	DECLARE @MAKH  CHAR(4), @DOANHSO_CU MONEY
	SELECT @MAKH=MAKH
	FROM INSERTED
 
	SELECT @DOANHSO_CU=DOANHSO
	FROM  DELETED
	UPDATE KHACHHANG
	SET DOANHSO=@DOANHSO_CU
	WHERE MAKH=@MAKH
	PRINT ('DA UPDATE 1 KHACHHANG')
END
go
CREATE TRIGGER INSERT_HOADON ON HOADON
FOR INSERT
AS
BEGIN
	DECLARE @TRIGIA MONEY, @MAKH CHAR(4)

	SELECT @MAKH=MAKH,@TRIGIA=TRIGIA
	FROM  INSERTED
 
	UPDATE KHACHHANG
	SET  DOANHSO=DOANHSO+@TRIGIA
	WHERE MAKH=@MAKH

	PRINT ('DA INSERT 1 HODON MOI VA UPDATE LAI DOANHSO CUA KH CO SOHD TREN')
END
go
CREATE TRIGGER DELETE_HOADON_C15
ON HOADON
FOR DELETE
AS
BEGIN
	DECLARE @TRIGIA MONEY, @MAKH CHAR(4)

	SELECT @MAKH=MAKH,@TRIGIA=TRIGIA
	FROM  DELETED
 
	UPDATE KHACHHANG
	SET  DOANHSO=DOANHSO-@TRIGIA
	WHERE MAKH=@MAKH

	PRINT ('DA DELETE 1 HODON MOI VA UPDATE LAI DOANHSO CUA KH CO SOHD TREN')
END

 ---------------
 go
CREATE TRIGGER UPDATE_HOADON_C15
ON HOADON
FOR UPDATE
AS
BEGIN
	DECLARE @TRIGIA_CU MONEY, @TRIGIA_MOI MONEY, @MAKH  CHAR(4)

	SELECT @MAKH=MAKH,@TRIGIA_MOI=TRIGIA
	FROM  INSERTED

	SELECT @MAKH=MAKH,@TRIGIA_CU=TRIGIA
	FROM  DELETED
  
	UPDATE KHACHHANG
	SET  DOANHSO=DOANHSO+@TRIGIA_MOI-@TRIGIA_CU
	WHERE MAKH=@MAKH

	PRINT ('DA UPDATE 1 HOADON MOI VA UPDATE LAI DOANHSO CUA KH CO SOHD TREN')
END
