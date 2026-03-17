with cte as(
    select book_id,count(record_id) as current_borrowers
    from borrowing_records
    where return_date is null
    group by book_id
)
select l.book_id,l.title,l.author,l.genre,l.publication_year,c.current_borrowers
from library_books l
join cte c
on c.book_id=l.book_id
where c.current_borrowers=l.total_copies
order by c.current_borrowers desc,l.title asc;
