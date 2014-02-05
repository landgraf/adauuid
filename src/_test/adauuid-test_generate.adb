with Ada.Text_IO; use Ada.Text_IO; 
with Aunit.Assertions;
package body adauuid.test_Generate is 

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
        Put_Line("Generator test...");
        Assert(Condition => not Is_Null(T.U1) and then not Is_Null(T.U2),  Message => "Null UUID was generated");
        Assert(Condition => T.U1 /= T.U2, Message => "Identical uuid are not expected"); 
    end Run_Test;

    function Name (T : TC) return Message_String is
        pragma Unreferenced(T);
    begin
        return Aunit.Format("Test case name : adauuid.generate test"); 
    end Name;
end adauuid.test_generate; 

