create or replace procedure assign_personnel_to_assignment(p_assignment_id in int, p_personnel_id in int) is
  type assignment_record is record (
    a_id assignments.a_id%type,
    p_id personnel.p_id%type
  );
  v_assignment assignment_record;
begin
  v_assignment.a_id := p_assignment_id;
  v_assignment.p_id := p_personnel_id;
  
  begin
    insert into assigned_personnel (a_id, p_id)
    values (v_assignment.a_id, v_assignment.p_id);
  exception
    when dup_val_on_index then
      dbms_output.put_line('personnel already assigned to this assignment.');
    when others then
      dbms_output.put_line('an unexpected error occurred.');
      raise;
  end;
  
  commit;
exception
  when others then
    rollback;
    raise;
end;
/
