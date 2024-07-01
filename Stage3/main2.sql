declare
  v_personnel_id int := 855164682;
  v_rank varchar2(50);
  v_assignment_id int := 1;
begin
  v_rank := get_personnel_rank(v_personnel_id);
  dbms_output.put_line('personnel rank: ' || v_rank);
  
  assign_personnel_to_assignment(v_assignment_id, v_personnel_id);
  dbms_output.put_line('personnel assigned to assignment.');
exception
  when others then
    dbms_output.put_line('an error occurred.');
end;
