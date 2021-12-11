CREATE TABLE tab1 (
    id NUMBER,
    clob_data CLOB
); -----------������� ��� ���������� �� ������

create or replace package body DataImportPackage as

procedure ImportActors (fname varchar2)
is
    TYPE actor_rec IS RECORD (
        name varchar2(255),
        surname varchar2(255),
        country varchar2(255),
        bday TIMESTAMP(6));
        
---��� ������ � ������
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
---��� ������ � �������
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row actor_rec;
begin
--���������� ������� ������� �� �����
    INSERT INTO tab1 (id, clob_data)
    VALUES (1, empty_clob()) --���������� ������ �������
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname); --���������� �����
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly); --��������� ����
    
    DBMS_LOB.loadclobfromfile ( --��������� ������ � �������
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); --��������� ����

    commit;
--������ � ��������
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/Actors/Actor' 
    PASSING xmltype( to_char(xml)) COLUMNS
        name varchar2(255) PATH './name',
        surname varchar2(255) PATH './surname',
        country varchar2(255) PATH './country',
        bday TIMESTAMP(6) PATH './bday');
        
    fetch cur into entity_row;
    dbms_output.put_line(entity_row.name);
    while cur%found loop
        ActorPackage.AddActor(entity_row.name, entity_row.surname, entity_row.country, entity_row.bday);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportActors;

end DataImportPackage;

begin
DataImportPackage.ImportActors('actors.xml');
end;
