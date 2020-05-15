select * from hotel;
select * from booking;
select * from room;

select * from guest;

----1
select h.hotelname, r.type, r.price   from hotel h, room r where h.hotelno = r.hotelno;

-----2
select h.hotelname, g.guestname, b.datefrom, b.dateto from hotel h,booking b, guest g 
where h.hotelno=b.hotelno and g.guestno=b.guestno;
