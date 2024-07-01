declare
  v_operation_id int := 432;
  v_report_count int;
  v_equipment_ids sys.odcinumberlist;
  v_new_status varchar2(20) := 'Taken';
  v_equipment_refcur sys_refcursor;
  v_e_id int;
begin
  -- Fetch equipment IDs from the database
  select cast(collect(e_id) as sys.odcinumberlist)
  into v_equipment_ids
  from equipment
  where status = 'Available';

  -- Get report count for the operation
  v_report_count := get_report_count_for_operation(v_operation_id);
  dbms_output.put_line('Number of reports for operation ' || v_operation_id || ': ' || v_report_count);
  
  -- Update equipment statuses
  update_equipment_status(v_equipment_ids, v_new_status, v_equipment_refcur);
  
  -- Print the equipment IDs from the REF CURSOR
  dbms_output.put_line('List of updated equipment IDs:');
  loop
    fetch v_equipment_refcur into v_e_id;
    exit when v_equipment_refcur%notfound;
    dbms_output.put_line('Equipment ID: ' || v_e_id);
  end loop;
  
  -- Close the REF CURSOR explicitly
  close v_equipment_refcur;
  
exception
  when others then
    dbms_output.put_line('An error occurred: ' || sqlerrm);
end;
