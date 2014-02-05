with adauuid; use adauuid; 
with Ada.Text_IO;  use Ada.Text_IO; 
with Ada.Assertions; use Ada.Assertions;
procedure test is 
begin
    for I in 1..100 loop
        declare
            U1 : UUID_Bin := Generate;
            U2 : UUID_Bin := Generate;
        begin
            pragma Debug(Put_Line("UUID:  " & Parse(U1, lower) & "/" & Parse(U2)));
            pragma Assert(U1 = U1);
            pragma Assert(U1 /= U2);
            Copy(Src => U1, Dst => U2);
            pragma Assert(U1 = U2);

            Clear(U1);
            Clear(U2);
        end;
    end loop;
end test; 

