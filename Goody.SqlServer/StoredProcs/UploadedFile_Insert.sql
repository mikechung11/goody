﻿CREATE PROC [dbo].[UploadedFile_Insert]
	@UserName NVARCHAR(128),
	@FileName NVARCHAR(128),
	@Size INT,
	@Type NVARCHAR(50),
	@SystemFileName NVARCHAR(128),
	@ModifiedBy NVARCHAR(128),
	@Id INT OUT
AS
/*
DECLARE @_id INT,
		@_userName NVARCHAR(128)		= 'SomeBooks',
		@_fileName NVARCHAR(128)		= 'old_books.jpg',
		@_size INT						= 128000,
		@_type NVARCHAR(50)				= 'jpg',
		@_systemFileName NVARCHAR(128)	= 'old_books_some_guid.jpg',
		@_modifiedBy NVARCHAR(128)		= 'insertedbyvic';

EXECUTE UploadedFile_Insert 
	@_userName,
	@_fileName,
	@_size,
	@_type,
	@_systemFileName,
	@_modifiedBy,
	@_id OUT;
	
	SELECT * FROM UploadedFile WHERE ID = @_id;
*/
BEGIN
	INSERT INTO	UploadedFile(
		UserName,
		FileName,
		Size,
		Type,
		SystemFileName,
		ModifiedBy)
	Values(
		@UserName,
		@FileName,
		@Size,
		@Type,
		@SystemFileName,
		@ModifiedBy);

	SET @Id = SCOPE_IDENTITY();
END