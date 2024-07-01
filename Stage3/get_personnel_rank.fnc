create or replace function get_personnel_rank(p_personnel_id in int)
return varchar2 is
  v_rank personnel.rank_%type;
begin
  select rank_
  into v_rank
  from personnel
  where p_id = p_personnel_id;

  return v_rank;
exception
  when no_data_found then
    return 'unknown';
  when others then
    dbms_output.put_line('an unexpected error occurred.');
    return 'error';
end;
/
