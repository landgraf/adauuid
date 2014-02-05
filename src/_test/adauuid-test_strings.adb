with Ada.Text_IO; use Ada.Text_IO; 
with Aunit.Assertions;
package body adauuid.test_strings is 

    overriding
    procedure Set_Up (T : in out TC) is 
    begin
        Parse(T.U1); 
        Parse(T.U2); 
    end Set_Up; 

    overriding
    procedure Tear_Down (T : in out TC) is 
    begin
        Clear(T.U1); 
        Clear(T.U2);
    end Tear_Down;


    procedure Run_Test (T : in out TC) is 
        use Aunit.Assertions;
        U : constant String := "A0AA0AEF-D4FD-4F29-9130-2EC830C2D188";
    begin
        Put_Line("Strings functions test...");
        From_String(T.U1, U); 
        Assert(Condition => To_String(T.U1) = U, Message => "Parse-unparse function test fauled");
    end Run_Test;

    function Name (T : TC) return Message_String is
        pragma Unreferenced(T);
    begin
        return Aunit.Format("Test case name : adauuid.to_string adauuid.from_string test"); 
    end Name;
end adauuid.test_strings; 

