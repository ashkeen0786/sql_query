use ex

create table empolyee(id int primary key identity,e_name varchar(20),email varchar(20),e_address varchar(20))

/*data insert by using stored procedure*/

create procedure insertdata
@name varchar(20),
@email varchar(20),
@address varchar(20)
as
begin
insert into empolyee values(@name,@email,@address)
end

insertdata 'ashkeen','ash@gmail.com','hasanpur'
insertdata 'suhail','suhail@gmail.com','hasanpur'

insertdata 'fazal','fazal@gmail.com','hasanpur'



/*data delete by using stored procedure*/
create procedure deletedata
@id int
as
begin
delete  from empolyee where id=@id
end
execute deletedata 2
execute deletedata 1

/*data update by using stored procedure*/
create procedure updatedata
@id int,
@name varchar(20)
as
begin
update empolyee set e_name=@name where id=@id
end

execute updatedata 3,'ashkeen'

/* function-----------*/
create function sumnum(@num1 as int,@num2 as int)
returns int
as
begin
return(@num1+@num2)
end

select dbo.sumnum(1,2)

create function example(@num1 int)
returns varchar(20)
as
begin
declare @res varchar(20)
if @num1>18
begin
set @res='yes'
end
else
begin
set @res='no'
end
return @res
end

select dbo.example(20)
/* triger-------------*/

create trigger tr on empolyee
after insert
as
begin
print 'insert new value'
end




select * from empolyee