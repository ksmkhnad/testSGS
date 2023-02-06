begin
declare @containerid uniqueidentifier = NULL
CREATE TABLE containers (
    containerId uniqueidentifier NOT NULL PRIMARY KEY,
    Number int NOT NULL,
    Type varchar(max) NOT NULL,
  Length int NOT NULL,
  Width  int NOT NULL,
  Height int NOT NULL,
  Weight int NOT NULL,
  isEmpty bit NOT NULL,
  CreatedDate datetime NOT NULL,
);

CREATE TABLE operations (
    operationId uniqueidentifier NOT NULL,
    containerId uniqueidentifier NOT NULL FOREIGN KEY REFERENCES containers(containerId),
    StarteddDate datetime NOT NULL,
  FinishedDate datetime NOT NULL,
  Type varchar(max) NOT NULL,
  NameofInspector varchar(max) NOT NULL,
  PlaceofInspect varchar(max) NOT NULL,
);
end

begin
INSERT containers( containerId, Number, Type, Length, Width, Height, Weight, isEmpty, CreatedDate)
VALUES (Newid(), 1, 'тип1', 10, 5, 5,5,1, getdate()),
       (Newid(), 1, 'тип2', 10, 5, 5,5,1, getdate());
	   end
select @containerid = containerId from containers where Type = 'тип1'
begin
INSERT operations( operationId, containerId, StarteddDate, FinishedDate, Type, NameofInspector, PlaceofInspect)
VALUES (Newid(), @containerid, getdate(), getdate(), 'тип1', 'имя1','место'),
       (Newid(), @containerid, getdate(), getdate(), 'тип3', 'имя2','место');
end

SELECT 
    '{"id":' + CAST(containerId as nvarchar(50)) + 
    ',"Number":' + CAST(Number as nvarchar(50)) + 
    ',"Type":"' + Type + 
    ',"Length":' + CAST(Length as nvarchar(50)) + 
    ',"Width":' + CAST(Width as nvarchar(50)) + 
    ',"Height":' + CAST(Height as nvarchar(50)) + 
    ',"Weight":' + CAST(Weight as nvarchar(50)) + 
    ',"isEmpty":' + CAST(isEmpty as nvarchar(50)) + 
    ',"CreatedDate":"' + CAST(CreatedDate as nvarchar(50)) + '"}' as json_data
FROM 
    containers

SELECT 
    '{"operationIdid":' + CAST(operationId as nvarchar(50)) + 
    ',"containerid":' + CAST(containerId as nvarchar(50)) + 
    ',"StarteddDate":' + CAST(StarteddDate as nvarchar(50)) + 
    ',"FinishedDate":' + CAST(FinishedDate as nvarchar(50)) + 
    ',"Type":"' + Type + 
    ',"NameofInspector":' + CAST(NameofInspector as nvarchar(50)) + 
    ',"PlaceofInspect":"' + CAST(PlaceofInspect as nvarchar(50)) + '"}' as json_data
FROM 
    operations where containerId = @containesrs
