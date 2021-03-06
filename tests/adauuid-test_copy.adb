with Ada.Text_IO; use Ada.Text_IO; 
with Aunit.Assertions;
package body adauuid.test_copy is 

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
        Put_Line("Copy test...");
        Copy(T.U1, T.U2); 
        Assert(Condition => T.U2 = T.U1, Message => "Copy function test failed"); 
        T.U1 := T.U2; 
        Assert(Condition => T.U2 = T.U1, Message => "Copy function test failed"); 
    end Run_Test;

    function Name (T : TC) return Message_String is
        pragma Unreferenced(T);
    begin
        return Aunit.Format("Test case name : adauuid.copy"); 
    end Name;
end adauuid.test_copy; 

