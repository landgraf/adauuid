with Ada.Text_IO; use Ada.Text_IO; 
with Aunit.Assertions;
package body adauuid.test_clear is 

    overriding
    procedure Set_Up (T : in out TC) is 
    begin
        Parse(T.U1); 
        Parse(T.U2); 
    end Set_Up; 

    overriding
    procedure Tear_Down (T : in out TC) is 
    begin
        null;
    end Tear_Down;


    procedure Run_Test (T : in out TC) is 
        use Aunit.Assertions;
        U : constant String := "A0AA0AEF-D4FD-4F29-9130-2EC830C2D188";
    begin
        Put_Line("Cleaning test..."); 
        Clear(T.U1); 
        Assert(Condition => Is_Null(T.U1), Message => "Clean function test failed");
        Assert(Condition => Is_Null(T.U2), Message => "Clean function test check failed"); 
        Clear(T.U2); 
        Assert(Condition => Is_Null(T.U1) and then Is_Null(T.U2), Message => "Clean function double clear failed"); 
    end Run_Test;

    function Name (T : TC) return Message_String is
        pragma Unreferenced(T);
    begin
        return Aunit.Format("Test case name : adauuid.copy test"); 
    end Name;
end adauuid.test_clear; 

