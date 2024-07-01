create or replace function get_report_count_for_operation(p_operation_id in int)
return int is
  v_report_count int := 0;
  v_report_id intelligence_reports.i_id%type;
  cursor report_cursor is
    select i_id
    from intelligence_reports
    where o_id = p_operation_id;
begin
  open report_cursor;
  loop
    fetch report_cursor into v_report_id;
    exit when report_cursor%notfound;
    v_report_count := v_report_count + 1;
  end loop;
  close report_cursor;
  
  return v_report_count;
exception
  when no_data_found then
    dbms_output.put_line('no data found.');
    return 0;
  when others then
    dbms_output.put_line('an unexpected error occurred.');
    return -1;
end;
/
