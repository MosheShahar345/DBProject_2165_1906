create or replace procedure update_equipment_status(
  p_equipment_ids in sys.odcinumberlist,
  p_new_status in varchar2,
  p_refcur out sys_refcursor
) is
begin

  if p_new_status not in ('Available', 'Taken') then
    raise_application_error(-20001, 'Invalid status value');
  else
    -- Update equipment statuses
    forall i in 1..p_equipment_ids.count
      update equipment
      set status = p_new_status
      where e_id = p_equipment_ids(i);

    -- Open ref cursor to fetch the updated equipment IDs
    open p_refcur for
      select e_id
      from equipment
      where e_id in (select column_value from table(p_equipment_ids))
        and status = p_new_status;
    commit;
  end if;

exception
  when others then
    dbms_output.put_line('An error occurred: ' || sqlerrm);
    if p_refcur%isopen then
      close p_refcur;
    end if;
    rollback;
    raise;
end;
/
